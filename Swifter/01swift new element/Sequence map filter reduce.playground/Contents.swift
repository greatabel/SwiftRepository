import UIKit

struct City {
    let name: String
    let population: Int
}
let paris = City(name: "Paris", population: 2241) // 单位为“千”
let madrid = City(name: "Madrid", population: 3165)
let amsterdam = City(name: "Amsterdam", population: 827)
let berlin = City(name: "Berlin", population: 3562)
let cities = [paris, madrid, amsterdam, berlin]


func findCityMoreThanOneMillion(_ cities: [City]) -> String {
    var result = "City: Population\n"
    for city in cities {
        if city.population > 1000 {
            result = result + "\(city.name): \(city.population / 10)w\n"
        }
    }
    return result
}
let result = findCityMoreThanOneMillion(cities)
print(result)

extension City {
    func cityByScalingPopulation() -> City {
        return City(name: name, population: population / 10)
    }
}

let resultA =
    cities.filter { $0.population > 1000 }
        .map { $0.cityByScalingPopulation() }
        .reduce("City again: Population") { result, c in
            return result + "\n" + "\(c.name): \(c.population)w"
}
print(resultA)


