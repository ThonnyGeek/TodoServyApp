//
//  PostDetailViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI

final class PostDetailViewModel: PostDetailFlowState {

    @Published var postId: Int
    
    @StateObject var businessData = BusinessData()

    @Published var text: String

    init(path: Binding<NavigationPath>, text: String?, postId: Int) {
        if let text = text {
            self.text = "First View with text: \(text)"
        } else {
            self.text = "Default First View"
        }
        
        self.postId = postId

        super.init(path: path)
        fillFields()
    }
    
    @Published var name: String = ""
    @Published var about: String = ""
    @Published var cellphone: String = ""
    @Published var picture: UIImage = UIImage(named: "orangeIphone")!
    @Published var rate: Int = 0
    @Published var stars: [String] = []
    
    @Published var modalIsDisplayed: Bool = false
    
    func fillFields() {
        for bussy in businessData.business {
            self.name = bussy.name
            self.about = bussy.about
            self.cellphone = bussy.cellphone
            self.picture = bussy.picture
            self.rate = bussy.rate
            self.stars = bussy.stars
        }
    }
    
    var starsTypes = ["star.fill", "star"]
    
    let sizes = UIScreen.main.bounds
    
    func didTapSaveButton() {
        print("s")
//        self.modalIsDisplayed = false
    }
    
    func didTapStar(_ id: Int) {
        print("Id: \(id)")
//        self.modalIsDisplayed = false
    }
    
    func didTabBackButton() {
        path.removeLast()
    }
    
    func didTapPhoto() {
        path.append(PostDetailLink.link)
    }
    
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
    
    // View functions
    
    func fetchStars() {
        _ = businessData.business.map {
            businessData.business[$0.id].stars = starst(rate: $0.rate)
        }
    }
}
