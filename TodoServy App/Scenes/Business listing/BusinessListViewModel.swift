//
//  BusinessListViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Combine
import SwiftUI


final class BusinessListViewModel: BusinessListFlowState {
    
    @Published var bussiness = [
        Bussiness(id: 0, name: "Nombre negocio 1", about: "Este es el About del negocio 1, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+593 9999 99999", picture: "orangeIphone", rate: 1, stars: [""]),
        Bussiness(id: 1,name: "Nombre negocio 2", about: "Este es el About del negocio 2, Lorem ipsum dolor sit amet, cosectetur adipiscing elit.", cellphone: "+89 9999 94949", picture: "orangeIphone", rate: 3, stars: [""]),
        Bussiness(id: 2,name: "Nombre negocio 3", about: "Este es el About del negocio 3, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+58 9999 98723", picture: "orangeIphone", rate: 4, stars: [""]),
        Bussiness(id: 3,name: "Nombre negocio 4", about: "Este es el About del negocio 4, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+39 9999 09236", picture: "orangeIphone", rate: 5, stars: [""]),
        Bussiness(id: 4,name: "Nombre negocio 5", about: "Este es el About del negocio 5, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+31 9999 97862", picture: "orangeIphone", rate: 3, stars: [""]),
        Bussiness(id: 5,name: "Nombre negocio 6", about: "Este es el About del negocio 6, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+1 9999 24535", picture: "orangeIphone", rate: 2, stars: [""]),
        Bussiness(id: 6,name: "Nombre negocio 7", about: "Este es el About del negocio 7, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+391 9999 56734", picture: "orangeIphone", rate: 1, stars: [""]),
        Bussiness(id: 7,name: "Nombre negocio 8", about: "Este es el About del negocio 8, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+21 9999 3958", picture: "orangeIphone", rate: 2, stars: [""]),
        Bussiness(id: 8,name: "Nombre negocio 9", about: "Este es el About del negocio 9, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+12 9999 65833", picture: "orangeIphone", rate: 3, stars: [""]),
        Bussiness(id: 9,name: "Nombre negocio 10", about: "Este es el About del negocio 10, Lorem ipsum dolor sit amet, consectetur adipiscing elit.", cellphone: "+2 9999 13245", picture: "orangeIphone", rate: 3, stars: [""])]
    
    
    let blue = Color(#colorLiteral(red: 0, green: 0.7068228722, blue: 1, alpha: 1)) // #0048FF
    
    let gray = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.735125207)) // #CDCDCD
    
    var starsTypes = ["star.fill", "star"]
    
    var stars = ["star", "star", "star", "star", "star"]
    
    func starst(rate: Int) -> [String] {
        
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
    //    func firAction() {
    //        path.append(ContentLink.firstLink(text: "Some param"))
    //    }
    
    //    func secondAction() {
    //        path.append(ContentLink.secondLink(number: 2))
    //    }
    
    //    func thirdAction() {
    //        path.append(ContentLink.thirdLink)
    //    }
    
    //    func customAction() {
    //        path.append("Custom action")
    //    }
    
    //    func sheetAction() {
    //        presentedItem = .sheetLink(item: "Sheet param")
    //    }
    
    //    func selectLinkAction() {
    //        selectedLink = .firstLink(text: "Selected link action")
    //    }
    
    //    func coverAction() {
    //        coverItem = .coverLink(item: "Cover param")
    //    }
}
