import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

class WeatherDatastore {
    let APIKey = "39541035d4e00b6ae6010d0e7c0418af"

    func retrieveCurrentWeatherAtLat(lat: CLLocationDegrees, lon: CLLocationDegrees,
                                     block: @escaping (_ weatherCondition: WeatherCondition) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/weather?APPID=\(APIKey)"
        let params = ["lat":lat, "lon":lon]

        Alamofire.request(url, parameters: params)
            .responseJSON {
                response in
                let json = JSON(response.data!)
//                print("retrieveCurrentWeatherAtLat= \(json)")
                block(self.createWeatherConditionFronJson(json: json))
        }

//        Alamofire.request(url, parameters: params)
//            .responseJSON { request, response, result in
//                switch result {
//                case .Success(let json):
//                    let json = JSON(json)
//                    block(weatherCondition: self.createWeatherConditionFronJson(json))
//                case .Failure(_, let error):
//                    print("Error: \(error)")
//                }
//        }
    }

    func retrieveHourlyForecastAtLat(lat: CLLocationDegrees,
                                     lon: CLLocationDegrees,
                                     block: @escaping (_ weatherConditions: Array<WeatherCondition>) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/forecast?APPID=\(APIKey)"
        let params = ["lat":lat, "lon":lon]
        Alamofire.request(url, parameters: params)
            .responseJSON {
                response in

                let json = JSON(response.data!)
                let list: Array<JSON> = json["list"].arrayValue

                let weatherConditions: Array<WeatherCondition> = list.map() {
                    return self.createWeatherConditionFronJson(json: $0)
                }
                block(weatherConditions)
        }

//        Alamofire.request(url, parameters: params)
//            .responseJSON { request, response, result in
//                switch result {
//                case .Success(let json):
//                    let json = JSON(json)
//                    let list: Array<JSON> = json["list"].arrayValue
//
//                    let weatherConditions: Array<WeatherCondition> = list.map() {
//                        return self.createWeatherConditionFronJson($0)
//                    }
//                    block(weatherConditions: weatherConditions)
//                case .Failure(_, let error):
//                    print("Error: \(error)")
//                }
//        }
    }

    func retrieveDailyForecastAtLat(lat: Double,
                                    lon: Double,
                                    dayCnt: Int,
                                    block: @escaping (_ weatherConditions: Array<WeatherCondition>) -> Void) {
        let url = "https://api.openweathermap.org/data/2.5/forecast/daily?APPID=\(APIKey)"
        let params = ["lat":lat, "lon":lon, "cnt":Double(dayCnt+1)]
        // --------daily is not free now, for testing:
        //        params = [:]
        //        url = "https://samples.openweathermap.org/data/2.5/forecast/daily?id=524901&appid=b1b15e88fa797225412429c1c50c122a1"
        var mockData = Data()
        do {
            if let file = Bundle.main.url(forResource: "mockdata", withExtension: "json") {
                mockData = try Data(contentsOf: file)

            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        // ------end of mock ---------------
        Alamofire.request(url, parameters: params)
            .responseJSON {
                response in

                var json = JSON(response.data!)
                // set mockdata
                json = JSON(mockData)
                print("##json=\(json)")
                let list: Array<JSON> = json["list"].arrayValue
                let weatherConditions: Array<WeatherCondition> = list.map() {
                    return self.createDayForecastFronJson(json: $0)
                }
                let count = weatherConditions.count
                print("###count=\(count)")
                if count >= 1 {
                    let daysWithoutToday = Array(weatherConditions[1..<count])
                    block(daysWithoutToday)
                }
        }
//        Alamofire.request(url, parameters: params)
//            .responseJSON { request, response, result in
//                switch result {
//                case .Success(let json):
//                    let json = JSON(json)
//                    let list: Array<JSON> = json["list"].arrayValue
//                    let weatherConditions: Array<WeatherCondition> = list.map() {
//                        return self.createDayForecastFronJson($0)
//                    }
//                    let count = weatherConditions.count
//                    let daysWithoutToday = Array(weatherConditions[1..<count])
//                    block(weatherConditions: daysWithoutToday)
//                case .Failure(_, let error):
//                    print("Error: \(error)")
//                }
//        }
    }

}
//private func readJson() {
//    do {
//        if let file = Bundle.main.url(forResource: "mockdata", withExtension: "json") {
//            let data = try Data(contentsOf: file)
//
////            let json = try JSONSerialization.jsonObject(with: data, options: [])
////            if let object = json as? [String: Any] {
////                // json is a dictionary
////                print(object)
////            } else if let object = json as? [Any] {
////                // json is an array
////                print(object)
////            } else {
////                print("JSON is invalid")
////            }
//        } else {
//            print("no file")
//        }
//    } catch {
//        print(error.localizedDescription)
//    }
//}

private extension WeatherDatastore {
    func createWeatherConditionFronJson(json: JSON) -> WeatherCondition{
        let name = json["name"].string
        let weather = json["weather"][0]["main"].stringValue
        let icon = json["weather"][0]["icon"].stringValue
        let dt = json["dt"].doubleValue
        let time = NSDate(timeIntervalSince1970: dt)
        let tempKelvin = json["main"]["temp"].doubleValue
        let maxTempKelvin = json["main"]["temp_max"].doubleValue
        let minTempKelvin = json["main"]["temp_min"].doubleValue

        return WeatherCondition(
            cityName: name,
            weather: weather,
            icon: IconType(rawValue: icon),
            time: time,
            tempKelvin: tempKelvin,
            maxTempKelvin: maxTempKelvin,
            minTempKelvin: minTempKelvin)
    }
    func createDayForecastFronJson(json: JSON) -> WeatherCondition{
        let name = ""
        let weather = json["weather"][0]["main"].stringValue
        let icon = json["weather"][0]["icon"].stringValue
        let dt = json["dt"].doubleValue
        let time = NSDate(timeIntervalSince1970: dt)
        let tempKelvin = json["temp"]["day"].doubleValue
        let maxTempKelvin = json["temp"]["max"].doubleValue
        let minTempKelvin = json["temp"]["min"].doubleValue

        return WeatherCondition(
            cityName: name,
            weather: weather,
            icon: IconType(rawValue: icon),
            time: time,
            tempKelvin: tempKelvin,
            maxTempKelvin: maxTempKelvin,
            minTempKelvin: minTempKelvin)
    }
}

