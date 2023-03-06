//
//  RateStarsViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import Foundation

final class RateStarsViewModel: RateStarsFlowState {
    
    @Published var postId: Int
    
    init(postId: Int) {
        self.postId = postId
    }
}
