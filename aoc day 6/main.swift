import Foundation

func loadData() -> String{
    do {
        return try String(contentsOfFile: "/Users/moritzdiedenhofen/Documents/Daten/input.txt")
    } catch {
        return ""
    }
}
var fishes = loadData().split(separator: ",").map {lanternFish(age: Int($0)!)}
var fishBabys = [lanternFish]()

for _ in 1 ... 80  {
    
    if fishBabys.count != 0 {
        fishes.append(contentsOf: fishBabys)
        fishBabys.removeAll()
    }
    
    for fish in fishes {
        if let baby = fish.increaseAge() {
            fishBabys.append(baby)
        }
    }
}

print("total fishes: \(fishes.count)")
class lanternFish {
    
    var age = 6
    
    init(age: Int) {
        self.age = age
    }
    
    init() {
        age += 3
    }

    func increaseAge() -> lanternFish? {
        age -= 1
        
        if age == 0 {
            return lanternFish()
        } else if age == -1 {
            age = 6
        }
       
        return nil
    }
}

