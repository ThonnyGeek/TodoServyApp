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
}
