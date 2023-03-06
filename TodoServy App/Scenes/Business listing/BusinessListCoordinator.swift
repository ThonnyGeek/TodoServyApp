//
//  BusinessListCoordinator.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import Foundation
import SwiftUI

open class BusinessListFlowState: ObservableObject {
    @Published var path = NavigationPath()
}

enum BusinessListLink: Hashable, Identifiable {
    
    case postDetail(postId: Int)
    case postItem
    
    var id: String {
        String(describing: self)
    }
}

struct BusinessListCoordinator<Content: View>: View {
    
    @ObservedObject var state: BusinessListFlowState
    let content: () -> Content
    
    var body: some View {
        NavigationStack(path: $state.path) {
            ZStack {
                content()
            }
            .navigationDestination(for: BusinessListLink.self, destination: linkDestination)
        }
    }
    
    @ViewBuilder private func linkDestination(link: BusinessListLink) -> some View {
        switch link {
        case .postDetail(let postId):
            postDetailDestination(postId: postId)
        case .postItem:
            postItemDestination()
        }
    }
    
    private func postDetailDestination(postId: Int) -> some View {
        let viewModel = PostDetailViewModel(path: $state.path, text: "", postId: postId)
        return PostDetailView(viewModel: viewModel)
    }
    
    private func postItemDestination() -> some View {
        let viewModel = PostItemViewModel(path: $state.path)
        return PostItemView(viewModel: viewModel)
    }
}
