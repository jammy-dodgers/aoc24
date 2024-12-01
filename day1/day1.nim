import strutils, sequtils, algorithm, tables

let lines = readFile("day1/input.txt").splitLines()

var L: seq[int] = @[]
var R: seq[int] = @[]

for line in lines:
    let lr = line.splitWhitespace()
    let (l, r) = (lr[0].parseInt(), lr[1].parseInt())
    L &= l; R &= r

L.sort(); R.sort()

echo "Pt 1: ", L.zip(R).mapIt(abs(it[0] - it[1])).foldr(a + b)

var countTable = R.toCountTable()

echo "Pt 2: ", L.mapIt(it * countTable[it]).foldr(a + b)