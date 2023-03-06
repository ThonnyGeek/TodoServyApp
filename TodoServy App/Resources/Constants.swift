//
//  Constants.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI


//struct TodoServyFonts {
//    public var openRegular = "OpenSans-Regular.ttf"
//    public var openBold = "OpenSans-Bold.ttf"
//    public var openLight = "OpenSans-Light.ttf"
//}

public extension Font {
    struct OpenSans {
        public static let openLight14 = Font.custom("OpenSansCondensed-Light", size: 14)
        public static let openLight18 = Font.custom("OpenSansCondensed-Light", size: 18)
        public static let openBold16 = Font.custom("OpenSansCondensed-Bold", size: 16)
        public static let openBold20 = Font.custom("OpenSansCondensed-Bold", size: 20)
        public static let openBold24 = Font.custom("OpenSansCondensed-Bold", size: 24)
        public static let openTitle32 = Font.custom("OpenSansCondensed-ExtraBold", size: 32)
        public static let openSemiBold16 = Font.custom("OpenSansCondensed-SemiBold", size: 16)
        public static let openSemiBold20 = Font.custom("OpenSansCondensed-SemiBold", size: 20)
        public static let openSemiBold32 = Font.custom("OpenSansCondensed-SemiBold", size: 32)
        
        public static let openRegular16 = Font.custom("OpenSansCondensed-Regular", size: 16)
        
        public static let openExtraBold16 = Font.custom("OpenSansCondensed-ExtraBold", size: 16)
        //OpenSans_Condensed-ExtraBold
        private init() { }
    }
}

public struct Colors {
    static let buttonRatingColor = Color(#colorLiteral(red: 0.3373144269, green: 0.8022883534, blue: 0.7626382113, alpha: 1))// #77CAC2
    
    static let buttonDeleteColor = Color(#colorLiteral(red: 0.9325736165, green: 0, blue: 0.1372304857, alpha: 1)) // #DA2B30
    
    static let detailBackground = Color(#colorLiteral(red: 0.9568627477, green: 0.9568627477, blue: 0.9568627477, alpha: 1)) // #F4F4F4
    
    static let starsFillColor = Color(#colorLiteral(red: 0.9370170236, green: 0.8097807169, blue: 0.1527633965, alpha: 1)) // #FBFF04
    
    static let buttonSaveColor = Color(#colorLiteral(red: 0.137254902, green: 0.862745098, blue: 0.3490196078, alpha: 1)) // #23DC59
    
    static let modalBackground = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)) // #7C7C7C
    
    static let textFieldBackground = Color(#colorLiteral(red: 0.968627451, green: 0.9764705882, blue: 0.9882352941, alpha: 1)) // #F7F9FC
    
    static let textFieldBorderColor = Color(#colorLiteral(red: 0.7154040227, green: 0.9038724303, blue: 0.9628528953, alpha: 1)) // #DAE6F4
    
    static let textFieldBorderErrorColor = Color(#colorLiteral(red: 0.9333333333, green: 0.3764705882, blue: 0.3725490196, alpha: 1)) // #EE605F
    
    static let textFieldFontColor = Color(#colorLiteral(red: 0.7490196078, green: 0.7568627451, blue: 0.7725490196, alpha: 1)) // #BFC1C5
    
    static let shadowGray = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.735125207)) // #CDCDCD
    
}

public struct Sizes {
    static let width = UIScreen.main.bounds.width
    
    static let height = UIScreen.main.bounds.height
}

public struct Functs {
    
    static var starsTypes = ["star.fill", "star"]
    
    @MainActor static func fetchStars(businessData: BusinessData) {
        _ = businessData.business.map {
            businessData.business[$0.id].stars = starst(rate: $0.rate)
        }
    }
    
    static func starst(rate: Int) -> [String] {
        
        switch rate {
        case 1:
            return [self.starsTypes[0], self.starsTypes[1], self.starsTypes[1], self.starsTypes[1], self.starsTypes[1]]
        case 2:
            return [self.starsTypes[0], self.starsTypes[0], self.starsTypes[1], self.starsTypes[1], self.starsTypes[1]]
        case 3:
            return [self.starsTypes[0], self.starsTypes[0], self.starsTypes[0], self.starsTypes[1], self.starsTypes[1]]
        case 4:
            return [self.starsTypes[0], self.starsTypes[0], self.starsTypes[0], self.starsTypes[0], self.starsTypes[1]]
        case 5:
            return [self.starsTypes[0], self.starsTypes[0], self.starsTypes[0], self.starsTypes[0], self.starsTypes[0]]
        default:
            return [self.starsTypes[1], self.starsTypes[1], self.starsTypes[1], self.starsTypes[1], self.starsTypes[1]]
        }
    }
}

/*
 OpenSans_Condensed-Light.ttf
 OpenSans_Condensed-Bold.ttf
 OpenSans_Condensed-SemiBold.ttf
 OpenSansCondensed-Light
 OpenSansCondensed-SemiBold
 OpenSansCondensed-Bold
 
 
 */
