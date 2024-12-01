import strutils, sequtils, algorithm, tables

var (L,R) = readFile("day1/input.txt").splitLines()
    .mapIt((let n = it.splitWhitespace(); (n[0].parseInt(), n[1].parseInt())))
    .unzip()

L.sort(); R.sort()

echo "Pt 1: ", L.zip(R).mapIt(abs(it[0] - it[1])).foldr(a + b)

var countTable = R.toCountTable()

echo "Pt 2: ", L.mapIt(it * countTable[it]).foldr(a + b)