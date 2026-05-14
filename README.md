FileDeserializeBenchmarking
===========================

## Results
```
-========== START TESTING ==========-
iterations : 1


fileSize : 1x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 90        |
| JSONDecoder        | 634       |
| PListSerialization | 14        |
| PListDecoder       | 96        |


fileSize : 10x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 22        |
| JSONDecoder        | 20        |
| PListSerialization | 15        |
| PListDecoder       | 35        |


fileSize : 100x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 126       |
| JSONDecoder        | 110       |
| PListSerialization | 110       |
| PListDecoder       | 259       |


fileSize : 1000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 1213      |
| JSONDecoder        | 1022      |
| PListSerialization | 1216      |
| PListDecoder       | 2602      |


fileSize : 10000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 12210     |
| JSONDecoder        | 10024     |
| PListSerialization | 9303      |
| PListDecoder       | 25917     |


fileSize : 100000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 121336    |
| JSONDecoder        | 101425    |
| PListSerialization | 86712     |
| PListDecoder       | 232888    |


-========== TEST ENDED ==========-
```

```
-========== START TESTING ==========-
iterations : 10


fileSize : 1x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 38        |
| JSONDecoder        | 38        |
| PListSerialization | 26        |
| PListDecoder       | 57        |


fileSize : 10x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 126       |
| JSONDecoder        | 117       |
| PListSerialization | 111       |
| PListDecoder       | 267       |


fileSize : 100x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 1125      |
| JSONDecoder        | 963       |
| PListSerialization | 965       |
| PListDecoder       | 2402      |


fileSize : 1000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 11049     |
| JSONDecoder        | 9468      |
| PListSerialization | 10289     |
| PListDecoder       | 27021     |


fileSize : 10000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 113883    |
| JSONDecoder        | 96854     |
| PListSerialization | 89497     |
| PListDecoder       | 231899    |


fileSize : 100000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 1133721   |
| JSONDecoder        | 926670    |
| PListSerialization | 843694    |
| PListDecoder       | 2309075   |


-========== TEST ENDED ==========-
```

```
-========== START TESTING ==========-
iterations : 100


fileSize : 1x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 241       |
| JSONDecoder        | 260       |
| PListSerialization | 217       |
| PListDecoder       | 483       |


fileSize : 10x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 1224      |
| JSONDecoder        | 1126      |
| PListSerialization | 1066      |
| PListDecoder       | 2596      |


fileSize : 100x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 11121     |
| JSONDecoder        | 9316      |
| PListSerialization | 9455      |
| PListDecoder       | 23501     |


fileSize : 1000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 111251    |
| JSONDecoder        | 91762     |
| PListSerialization | 97885     |
| PListDecoder       | 230965    |


fileSize : 10000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 1122363   |
| JSONDecoder        | 925056    |
| PListSerialization | 872768    |
| PListDecoder       | 2330574   |


fileSize : 100000x:

| Parser             | Time (µs) |
|--------------------|-----------|
| JSONSerialization  | 11320833  |
| JSONDecoder        | 9295103   |
| PListSerialization | 8382666   |
| PListDecoder       | 23238703  |


-========== TEST ENDED ==========-
```

## Credits

- .json files generated with http://www.filltext.com/
- .plist files generated with https://github.com/javiertoledo/json2plist
- benchmarking with method described in http://nshipster.com/benchmarking/
