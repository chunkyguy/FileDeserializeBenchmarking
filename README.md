FileDeserializeBenchmarking
===========================

## Results
"-========== START TESTING ==========-"
"iterations : 1"

"fileSize : 1x:"
"121µs : JSONSerialization"
"1108µs : JSONDecoder"
"26µs : PListSerialization"
"83µs : PListDecoder"

"fileSize : 10x:"
"26µs : JSONSerialization"
"21µs : JSONDecoder"
"20µs : PListSerialization"
"36µs : PListDecoder"

"fileSize : 100x:"
"148µs : JSONSerialization"
"112µs : JSONDecoder"
"138µs : PListSerialization"
"272µs : PListDecoder"

"fileSize : 1000x:"
"1398µs : JSONSerialization"
"1008µs : JSONDecoder"
"1271µs : PListSerialization"
"2614µs : PListDecoder"

"fileSize : 10000x:"
"13952µs : JSONSerialization"
"9783µs : JSONDecoder"
"11279µs : PListSerialization"
"24666µs : PListDecoder"

"fileSize : 100000x:"
"150849µs : JSONSerialization"
"102074µs : JSONDecoder"
"108093µs : PListSerialization"
"247503µs : PListDecoder"

"-========== TEST ENDED ==========-"


"-========== START TESTING ==========-"
"iterations : 10"

"fileSize : 1x:"
"135µs : JSONSerialization"
"1049µs : JSONDecoder"
"48µs : PListSerialization"
"127µs : PListDecoder"

"fileSize : 10x:"
"174µs : JSONSerialization"
"137µs : JSONDecoder"
"156µs : PListSerialization"
"283µs : PListDecoder"

"fileSize : 100x:"
"1428µs : JSONSerialization"
"1026µs : JSONDecoder"
"1216µs : PListSerialization"
"2482µs : PListDecoder"

"fileSize : 1000x:"
"13646µs : JSONSerialization"
"10246µs : JSONDecoder"
"12486µs : PListSerialization"
"24113µs : PListDecoder"

"fileSize : 10000x:"
"143846µs : JSONSerialization"
"100515µs : JSONDecoder"
"116854µs : PListSerialization"
"238300µs : PListDecoder"

"fileSize : 100000x:"
"1373675µs : JSONSerialization"
"1007743µs : JSONDecoder"
"1097086µs : PListSerialization"
"2408213µs : PListDecoder"

"-========== TEST ENDED ==========-"

"-========== START TESTING ==========-"
"iterations : 100"

"fileSize : 1x:"
"448µs : JSONSerialization"
"1431µs : JSONDecoder"
"322µs : PListSerialization"
"640µs : PListDecoder"

"fileSize : 10x:"
"1634µs : JSONSerialization"
"1245µs : JSONDecoder"
"1446µs : PListSerialization"
"2877µs : PListDecoder"

"fileSize : 100x:"
"13464µs : JSONSerialization"
"9916µs : JSONDecoder"
"11823µs : PListSerialization"
"24207µs : PListDecoder"

"fileSize : 1000x:"
"147270µs : JSONSerialization"
"100548µs : JSONDecoder"
"120236µs : PListSerialization"
"242156µs : PListDecoder"

"fileSize : 10000x:"
"1364577µs : JSONSerialization"
"991943µs : JSONDecoder"
"1135411µs : PListSerialization"
"2463587µs : PListDecoder"

"fileSize : 100000x:"
"13768190µs : JSONSerialization"
"9849367µs : JSONDecoder"
"10867724µs : PListSerialization"
"24155329µs : PListDecoder"

"-========== TEST ENDED ==========-"


"-========== START TESTING ==========-"
"iterations : 1000"

"fileSize : 1x:"
"3ms : JSONSerialization"
"3ms : JSONDecoder"
"2ms : PlistSerialization"
"5ms : PlistDecoder"

"fileSize : 10x:"
"15ms : JSONSerialization"
"12ms : JSONDecoder"
"14ms : PlistSerialization"
"28ms : PlistDecoder"

"fileSize : 100x:"
"149ms : JSONSerialization"
"102ms : JSONDecoder"
"118ms : PlistSerialization"
"239ms : PlistDecoder"

"fileSize : 1000x:"
"1344ms : JSONSerialization"
"983ms : JSONDecoder"
"1203ms : PlistSerialization"
"2377ms : PlistDecoder"

"fileSize : 10000x:"
"13608ms : JSONSerialization"
"9783ms : JSONDecoder"
"11156ms : PlistSerialization"
"23711ms : PlistDecoder"

"fileSize : 100000x:"
"138652ms : JSONSerialization"
"100192ms : JSONDecoder"
"109987ms : PlistSerialization"
"238232ms : PlistDecoder"

"-========== TEST ENDED ==========-"

## Credits

- .json files generated with http://www.filltext.com/
- .plist files generated with https://github.com/javiertoledo/json2plist
- benchmarking with method described in http://nshipster.com/benchmarking/
