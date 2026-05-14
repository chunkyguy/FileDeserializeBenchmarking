//
//  Benchmark.swift
//  FileDeserializeBenchmarking
//
//  Created by Sidharth Juyal on 12/05/2026.
//

import Foundation
import CoreGraphics
import UIKit

private let kNumberOfIterations = 1
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

  init(_ dict: NSDictionary) {
    self.uid = dict["uid"] as! Int
    self.firstName = dict["firstName"] as! String
    self.lastName = dict["lastName"] as! String
  }
}

struct List: Codable {
  var List: [User]

  init(List: [User]) {
    self.List = List
  }

  init?(_ dict: NSDictionary) {
    let userDicts = dict["List"] as! [NSDictionary]
    self.List = userDicts.map { User($0) }
  }
}

enum ContentType: String, CaseIterable {
  case json
  case plist
}

struct File: Hashable {
  var name: String { "data_dictionary_root_\(size)" }

  var size: Int
  var type: ContentType
}

enum ParserType: String, CaseIterable {
  case classic
  case modern
}

func runBenchmark() {
  debugPrint("-========== START TESTING ==========-")
  debugPrint("iterations : \(kNumberOfIterations)")

  var fileSizes: [Int] = []
  var i = 1
  while i <= kMaxDataset {
    fileSizes.append(i)
    i *= 10
  }

  // load files
  var contents: [File: Data] = [:]
  for fileSize in fileSizes {
    for type in ContentType.allCases {
      let file = File(size: fileSize, type: type)
      contents[file] = try! load(file: file)
    }
  }

  for fileSize in fileSizes {
    var results: [(ContentType, ParserType, Double)] = []
    for type in ContentType.allCases {
      let file = File(size: fileSize, type: type)
      for parser in ParserType.allCases {
        let t = parse(data: contents[file]!, parser: parser, file: file)
        results.append((type, parser, t))
      }
    }

    debugPrint()
    debugPrint("fileSize : \(fileSize)x:")
    for (type, parser, t) in results {
      debugPrint("\(t.toMicro)µs : \(parserName(parser: parser, type: type))")
    }
  }

  debugPrint()
  debugPrint("-========== TEST ENDED ==========-");
}

func load(file: File) throws -> Data {
  guard let filePath = Bundle.main.url(forResource: file.name, withExtension: file.type.rawValue) else {
    throw BenchmarkError.fileNotFound
  }
  return try Data(contentsOf: filePath)
}

func parse(data: Data, parser: ParserType, file: File) -> Double {
  let startTime = CACurrentMediaTime()

  for _ in 0..<kNumberOfIterations {
    switch (file.type, parser) {
    case (.json, .classic):
      let object = try! JSONSerialization.jsonObject(with: data) as! NSDictionary
      let list = List(object)!
      assert(list.List.count == file.size)

    case (.json, .modern):
      let list = try! JSONDecoder().decode(List.self, from: data)
      assert(list.List.count == file.size)

    case (.plist, .classic):
      let object = try! PropertyListSerialization.propertyList(from: data, format: nil) as! NSDictionary
      let list = List(object)!
      assert(list.List.count == file.size)

    case (.plist, .modern):
      let list = try! PropertyListDecoder().decode(List.self, from: data)
      assert(list.List.count == file.size)
    }
  }

  return CACurrentMediaTime() - startTime
}

func parserName(parser: ParserType, type: ContentType) -> String {
  switch (type, parser) {
  case (.json, .classic): return "JSONSerialization"
  case (.json, .modern): return "JSONDecoder"
  case (.plist, .classic): return "PListSerialization"
  case (.plist, .modern): return "PListDecoder"
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
