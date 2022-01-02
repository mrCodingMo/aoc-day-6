import Foundation

func loadData() -> String{
    do {
        return try String(contentsOfFile: "/Users/moritzdiedenhofen/Documents/Daten/input.txt")
    } catch {
        return ""
    }
}
var fishAges = loadData().split(separator: ",").map {Int($0)!}

print("0: \(fishAges)")

for day in 1 ... 256  {
    
    let newBabieCount = fishAges.filter {$0 == 0}.count
    fishAges.append(contentsOf: Array(repeating: 9, count: newBabieCount))
    fishAges = fishAges.map {$0 == 0 ? $0 + 6 : $0 - 1}
}

print("total fishes: \(fishAges.count)")
