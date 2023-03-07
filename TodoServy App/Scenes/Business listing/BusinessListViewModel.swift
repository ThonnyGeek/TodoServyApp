//
//  BusinessListViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Combine
import SwiftUI


final class BusinessListViewModel: BusinessListFlowState {
    
    func openPostDetail(itemId: Int) {
        path.append(BusinessListLink.postDetail(postId: itemId))
    }
    
    func openPostItemView() {
        path.append(BusinessListLink.postItem)
    }
}
