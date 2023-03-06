//
//  Bussiness.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Foundation
import UIKit

struct Business: Identifiable {
    
    var id: UUID
    var name: String
    var about: String
    var cellphone: String
    var picture: UIImage
    var rate: Int
    var stars: [String]
    var totalRating: Double
    
    init(id: UUID, name: String, about: String, cellphone: String, picture: UIImage, rate: Int, stars: [String], totalRating: Double) {
        self.id = id
        self.name = name
        self.about = about
        self.cellphone = cellphone
        self.picture = picture
        self.rate = rate
        self.stars = stars
        self.totalRating = totalRating
    }
}

@MainActor class BusinessData: ObservableObject {
    
    @Published public var business: [Business] = [
        Business(id: UUID(), name: "Mascoticas", about: "Este es el About del negocio 1, Lorem ipsum dolor sit amet, consectetur adipiscing elit ipsum dolor sit amet consectetur adipiscing elit ipsum dolor sit amet consectetur adipiscing elit.", cellphone: "+593 9999 99999", picture: UIImage(named: "orangeIphone")!, rate: 0, stars: ["star", "star", "star", "star", "star"], totalRating: 0),
        Business(id: UUID(), name: "Mis peques", about: "Este es el About del negocio 2, Lorem ipsum dolor sit amet, consectetur adipiscing elit ipsum dolor sit amet consectetur adipiscing elit ipsum dolor sit amet consectetur adipiscing elit.", cellphone: "+1 2111 21111", picture: UIImage(named: "orangeIphone")!, rate: 0, stars: ["star", "star", "star", "star", "star"], totalRating: 0)
    ]
}
