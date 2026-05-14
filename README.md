FileDeserializeBenchmarking
===========================

## Results
"-========== START TESTING on %@ ==========-"
"type:json" "fileSize:1:"
"  time(ms): 3" "JSONSerialization"
"  time(ms): 3" "JSONDecoder"
"type:plist" "fileSize:1:"
"  time(ms): 2" "PlistSerialization"
"  time(ms): 5" "PlistDecoder"

"type:json" "fileSize:10:"
"  time(ms): 15" "JSONSerialization"
"  time(ms): 12" "JSONDecoder"
"type:plist" "fileSize:10:"
"  time(ms): 14" "PlistSerialization"
"  time(ms): 28" "PlistDecoder"

"type:json" "fileSize:100:"
"  time(ms): 149" "JSONSerialization"
"  time(ms): 102" "JSONDecoder"
"type:plist" "fileSize:100:"
"  time(ms): 118" "PlistSerialization"
"  time(ms): 239" "PlistDecoder"

"type:json" "fileSize:1000:"
"  time(ms): 1344" "JSONSerialization"
"  time(ms): 983" "JSONDecoder"
"type:plist" "fileSize:1000:"
"  time(ms): 1203" "PlistSerialization"
"  time(ms): 2377" "PlistDecoder"

"type:json" "fileSize:10000:"
"  time(ms): 13608" "JSONSerialization"
"  time(ms): 9783" "JSONDecoder"
"type:plist" "fileSize:10000:"
"  time(ms): 11156" "PlistSerialization"
"  time(ms): 23711" "PlistDecoder"

"type:json" "fileSize:100000:"
"  time(ms): 138652" "JSONSerialization"
"  time(ms): 100192" "JSONDecoder"
"type:plist" "fileSize:100000:"
"  time(ms): 109987" "PlistSerialization"
"  time(ms): 238232" "PlistDecoder"
"-========== TEST ENDED ==========-"

## Credits

- .json files generated with http://www.filltext.com/
- .plist files generated with https://github.com/javiertoledo/json2plist
- benchmarking with method described in http://nshipster.com/benchmarking/
