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
    
    init(id: UUID, name: String, about: String, cellphone: String, picture: UIImage, rate: Int, stars: [String]) {
        self.id = id
        self.name = name
        self.about = about
        self.cellphone = cellphone
        self.picture = picture
        self.rate = rate
        self.stars = stars
    }
}

@MainActor class BusinessData: ObservableObject {
    
    @Published public var business: [Business] = [
        Business(id: UUID(), name: "Venta de forros iPhone", about: "Este negocio es de muestra, si se desea se puede eliminar", cellphone: "+593 9999 99999", picture: UIImage(named: "orangeIphone")!, rate: 0, stars: ["star", "star", "star", "star", "star"])
    ]
}
