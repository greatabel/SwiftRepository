import Foundation

// http://openweathermap.org/weather-conditions
struct WeatherCondition {
    let cityName: String?
    let weather: String
    let icon: IconType?
    let time: NSDate
    let tempKelvin: Double
    let maxTempKelvin: Double
    let minTempKelvin: Double

    var tempFahrenheit: Double {
        get {
            return tempCelsius * 9.0/5.0 + 32.0
        }
    }

    var maxTempFahrenheit: Double {
        get {
            return maxTempCelsius * 9.0/5.0 + 32.0
        }
    }
    var minTempFahrenheit: Double {
        get {
            return minTempCelsius * 9.0/5.0 + 32.0
        }
    }

    var tempCelsius: Double {
        get {
            return tempKelvin - 273.15
        }
    }
    var maxTempCelsius: Double {
        get {
            return maxTempKelvin - 273.15
        }
    }
    var minTempCelsius: Double {
        get {
            return minTempKelvin - 273.15
        }
    }
}

enum IconType: String {
    case i01d = "01d"
    case i01n = "01n"
    case i02d = "02d"
    case i02n = "02n"
    case i03d = "03d"
    case i03n = "03n"
    case i04d = "04d"
    case i04n = "04n"
    case i09d = "09d"
    case i09n = "09n"
    case i10d = "10d"
    case i10n = "10n"
    case i11d = "11d"
    case i11n = "11n"
    case i13d = "13d"
    case i13n = "13n"
    case i50d = "50d"
    case i50n = "50n"
}
