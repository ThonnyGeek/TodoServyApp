//
//  BusinessListViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Combine
import SwiftUI


final class BusinessListViewModel: BusinessListFlowState {
    
//    @Published var businessData = [
//        Business(id: 0, name: "Nombre negocio w1", about: "Este es el About del negocio 1, Lorem ipsum dolor sit amet, consectetur adipiscing elit ipsum dolor sit amet consectetur adipiscing elit ipsum dolor sit amet consectetur adipiscing elit.", cellphone: "+593 9999 99999", picture: "orangeIphone", rate: 1, stars: [""])]
    
    
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
    
    func openPostDetail(itemId: Int) {
        path.append(BusinessListLink.postDetail(postId: itemId))
    }
    
    func openPostItemView() {
        path.append(BusinessListLink.postItem)
    }
}
