//
//  BusinessListViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Combine
import SwiftUI


final class BusinessListViewModel: BusinessListFlowState {
    
    let blue = Color(#colorLiteral(red: 0, green: 0.7068228722, blue: 1, alpha: 1)) // #0048FF
    
    let gray = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.735125207)) // #CDCDCD
    
    var counter: Int = 0
    
    func openPostDetail(itemId: Int) {
        path.append(BusinessListLink.postDetail(postId: itemId))
    }
    
    func openPostItemView() {
        path.append(BusinessListLink.postItem)
    }
}
