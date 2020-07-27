//
//  TextStyles.swift
//  MediSoft
//
//  Created by Guillermo Bernal on 7/11/20.
//

import SwiftUI

struct FontNameManager {
    //MARK: Lato
    struct Lato {
        static let black = "Lato-Black"
        static let blackItalic = "Lato-BlackItalic"
        static let bold = "Lato-Bold"
        static let boldItalic = "Lato-BoldItalic"
        static let italic = "Lato-Italic"
        static let light = "Lato-Light"
        static let lightItalic = "Lato-LightItalic"
        static let regular = "Lato-Regular"
        static let thin = "Lato-Thin"
        static let thinItalic = "Lato-ThinItalic"
    }

    // MARK: MontSerrat
    struct Montserrat {
        static let black = "Montserrat-Black"
        static let blackItalic = "Montserrat-BlackItalic"
        static let bold = "Montserrat-Bold"
        static let extraBoldItalic = "Montserrat-ExtraBoldItalic"
        static let extraLight = "Montserrat-ExtraLight"
        static let extraLightItalic = "Montserrat-ExtraLightItalic"
        static let italic = "Montserrat-Italic"
        static let light = "Montserrat-Light"
        static let lightItalic = "Montserrat-LightItalic"
        static let medium = "Montserrat-Medium"
        static let mediumItalic = "Montserrat-MediumItalic"
        static let regular = "Montserrat-Regular"
        static let semiBold = "Montserrat-SemiBold"
        static let semiBoldItalic = "Montserrat-SemiBoldItalic"
        static let thin = "Montserrat-Thin"
        static let thinItalic = "Montserrat-ThinItalic"
    }

    static let largeTitle = Font.custom(Montserrat.bold, size: 30)
    static let title = Font.custom(Montserrat.regular, size: 20)
    static let body = Font.custom(Lato.regular, size: 14)
    static let body2 = Font.custom(Montserrat.regular, size: 12)
}
