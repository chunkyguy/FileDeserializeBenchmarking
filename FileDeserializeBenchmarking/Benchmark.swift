//
//  Benchmark.swift
//  FileDeserializeBenchmarking
//
//  Created by Sidharth Juyal on 12/05/2026.
//

import Foundation
import CoreGraphics
import UIKit

private let kNumberOfIterations = 1_000
private let kMaxDataset = 100_000

enum BenchmarkError: Error {
  case fileNotFound
}

struct User: Codable {
  var uid: Int
  var firstName: String
  var lastName: String

  init(uid: Int, firstName: String, lastName: String) {
    self.uid = uid
    self.firstName = firstName
    self.lastName = lastName
  }

  init?(_ dict: NSDictionary) {
    guard
      let uid = dict["uid"] as? Int,
      let firstName = dict["firstName"] as? String,
      let lastName = dict["lastName"] as? String else {
      return nil
    }

    self.init(uid: uid, firstName: firstName, lastName: lastName)
  }
}

struct List: Codable {
  var List: [User]

  init(List: [User]) {
    self.List = List
  }

  init?(_ dict: NSDictionary) {
    guard let userDicts = dict["List"] as? [NSDictionary] else {
      return nil
    }
    let list = userDicts.compactMap { User($0) }
    self.init(List: list)
  }
}

enum ContentType: String, CaseIterable {
  case json
  case plist
}

struct File {
  var name: String { "data_dictionary_root_\(size)" }

  var size: Int
  var type: ContentType
}

enum Parser: String, CaseIterable {
  case old
  case new
}

func runBenchmark() {
  debugPrint("-========== START TESTING on %@ ==========-")

  var files: [File] = []
  var i = 1
  while i <= kMaxDataset {
    for contentType in ContentType.allCases {
      files.append(File(size: i, type: contentType))
    }
    i *= 10
  }

  // load files
  var contents: [(File, Data)] = []
  for file in files {
    contents.append((file, try! load(file: file)))
  }

  for (file, data) in contents {
    let results = Parser.allCases.map {
      ($0, parse(data: data, parser: $0, file: file))
    }

    debugPrint("type:\(file.type.rawValue)", "fileSize:\(file.size):")
    for (parser, t) in results {
      debugPrint("  time([ms): \(t.toMilli)", "parser:\(parserName(parser: parser, file: file))")
    }
  }

  debugPrint("-========== TEST ENDED ==========-");
}

func load(file: File) throws -> Data {
  guard let filePath = Bundle.main.url(forResource: file.name, withExtension: file.type.rawValue) else {
    throw BenchmarkError.fileNotFound
  }
  return try Data(contentsOf: filePath)
}

func parse(data: Data, parser: Parser, file: File) -> Double {
  let startTime = CACurrentMediaTime()
  for _ in 0..<kNumberOfIterations {
    switch (file.type, parser) {
    case (.json, .old):
      let object = try! JSONSerialization.jsonObject(with: data) as! NSDictionary
      let list = List(object)!
      assert(list.List.count == file.size)

    case (.json, .new):
      let list = try! JSONDecoder().decode(List.self, from: data)
      assert(list.List.count == file.size)

    case (.plist, .old):
      let object = try! PropertyListSerialization.propertyList(from: data, format: nil) as! NSDictionary
      let list = List(object)!
      assert(list.List.count == file.size)

    case (.plist, .new):
      let list = try! PropertyListDecoder().decode(List.self, from: data)
      assert(list.List.count == file.size)
    }
  }
  return CACurrentMediaTime() - startTime
}

func parserName(parser: Parser, file: File) -> String {
  switch (file.type, parser) {
  case (.json, .old): return "JSONSerialization"
  case (.json, .new): return "JSONDecoder"
  case (.plist, .old): return "PListSerialization"
  case (.plist, .new): return "PListDecoder"
  }
}

extension CFTimeInterval {
  var toMilli: Int64 {
    Int64(self * 1_000)
  }

  var toMicro: Int64 {
    Int64(self * 1_000_000)
  }

  var toNano: Int64 {
    Int64(self * 1_000_000_000)
  }
}
