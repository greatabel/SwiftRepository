import Foundation
import WeatherIconsKit

func iconStringFromIcon(icon: IconType, size: CGFloat) -> NSAttributedString {
    switch icon {
    case .i01d:
        return WIKFontIcon.wiDaySunnyIcon(withSize: size).attributedString()
    case .i01n:
        return WIKFontIcon.wiNightClear(withSize: size).attributedString()
    case .i02d:
        return WIKFontIcon.wiDayCloudyIcon(withSize: size).attributedString()
    case .i02n:
        return WIKFontIcon.wiNightCloudyIcon(withSize: size).attributedString()
    case .i03d:
        return WIKFontIcon.wiDayCloudyIcon(withSize: size).attributedString()
    case .i03n:
        return WIKFontIcon.wiNightCloudyIcon(withSize: size).attributedString()
    case .i04d:
        return WIKFontIcon.wiCloudyIcon(withSize: size).attributedString()
    case .i04n:
        return WIKFontIcon.wiCloudyIcon(withSize: size).attributedString()
    case .i09d:
        return WIKFontIcon.wiDayShowersIcon(withSize: size).attributedString()
    case .i09n:
        return WIKFontIcon.wiNightShowersIcon(withSize: size).attributedString()
    case .i10d:
        return WIKFontIcon.wiDayRain(withSize: size).attributedString()
    case .i10n:
        return WIKFontIcon.wiNightRain(withSize: size).attributedString()
    case .i11d:
        return WIKFontIcon.wiDayThunderstormIcon(withSize: size).attributedString()
    case .i11n:
        return WIKFontIcon.wiNightThunderstormIcon(withSize: size).attributedString()
    case .i13d:
        return WIKFontIcon.wiSnow(withSize: size).attributedString()
    case .i13n:
        return WIKFontIcon.wiSnow(withSize: size).attributedString()
    case .i50d:
        return WIKFontIcon.wiFogIcon(withSize: size).attributedString()
    case .i50n:
        return WIKFontIcon.wiFogIcon(withSize: size).attributedString()
    }

}

