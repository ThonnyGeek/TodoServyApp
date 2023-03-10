//
//  PostDetailViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI

final class PostDetailViewModel: PostDetailFlowState {

    @Published var postId: Int
    
    @EnvironmentObject var businessData:  BusinessData

    @Published var text: String

    init(path: Binding<NavigationPath>, text: String?, postId: Int) {
        if let text = text {
            self.text = "First View with text: \(text)"
        } else {
            self.text = "Default First View"
        }
        
        self.postId = postId

        super.init(path: path)
    }
    
    @Published var name: String = ""
    @Published var about: String = ""
    @Published var cellphone: String = ""
    @Published var picture: UIImage = UIImage(named: "orangeIphone")!
    @Published var rate: Int = 0
    @Published var stars: [String] = []
    @Published var modalIsDisplayed: Bool = false
    @Published var saveButtonIsDisabled: Bool = true
    @Published var starsInModal = ["star", "star", "star", "star", "star"]
    
    let emptyRate = ["star", "star", "star", "star", "star"]
    
    let sizes = UIScreen.main.bounds
    
    func didTapSaveButton() {
        self.starsInModal = self.emptyRate
        
        self.modalIsDisplayed = false
        
        self.saveButtonIsDisabled = true
    }
    
    func didTapStar() {
        if self.saveButtonIsDisabled {
            self.saveButtonIsDisabled.toggle()
        }
    }
    
    func didTabBackButton() {
        path.removeLast()
    }
    
    func didTapPhoto() {
        path.append(PostDetailLink.photoDestination(postId: postId))
    }
    
    func didTapDeleteBusiness() {
        didTabBackButton()
    }
}
