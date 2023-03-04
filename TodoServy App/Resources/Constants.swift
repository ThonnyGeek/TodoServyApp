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
        public static let openLight = Font.custom("OpenSans-Light", size: 12)
        public static let openRegular = Font.custom("OpenSans-Regular", size: 16)
        public static let openBold = Font.custom("OpenSans-Bold", size: 20)
        public static let openTitle = Font.custom("OpenSans-Bold", size: 32)
        public static let openSemiBold = Font.custom("OpenSans-SemiBold", size: 16)
        
        private init() { }
    }
    
}
