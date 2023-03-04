//
//  Bussiness.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Foundation

struct Bussiness: Identifiable {
    var id: Int
    
    var name: String
    var about: String
    var cellphone: String
    var picture: String
    var rate: Int
    var stars: [String]
    
    init(id: Int, name: String, about: String, cellphone: String, picture: String, rate: Int, stars: [String]) {
        self.id = id
        self.name = name
        self.about = about
        self.cellphone = cellphone
        self.picture = picture
        self.rate = rate
        self.stars = stars
    }
}
