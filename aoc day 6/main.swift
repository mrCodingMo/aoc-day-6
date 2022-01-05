import Foundation

func loadData() -> String{
    do {
        return try String(contentsOfFile: "/Users/moritzdiedenhofen/Documents/Daten/input.txt")
    } catch {
        return ""
    }
}

var fishAges = loadData().split(separator: ",").map {Int($0)!}
var fishes = Array(repeating: 0, count: 10)

for i in 0 ... 8 {
    fishes[i] = fishAges.filter {$0 == i}.count
}

for day in 1 ... 256  {
    
    //Create babies
    fishes[9] += fishes[0]
    
    //Reset age
    fishes[7] += fishes[0]
    fishes[0] = 0
    
    var newFishes = Array(repeating: 0, count: 10)
    
    for i in stride(from: 9, to: 0, by: -1) {
        newFishes[i - 1] = fishes[i]
    }
    
    fishes = newFishes
}

print("total: \(fishes.reduce(0, +))")

