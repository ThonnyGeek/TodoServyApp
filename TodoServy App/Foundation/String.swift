//
//  String.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 5/03/23.
//

import Foundation

extension String {
    func isValidRegx(pattern: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        return regex.rangeOfFirstMatch(in: self, options: .reportProgress, range: NSRange(location: 0, length: self.count)).location != NSNotFound
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func isValidPhoneNumber() -> Bool {
        let regEx = "^\\+(?:[0-9]?){6,14}[0-9]$"

        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}
