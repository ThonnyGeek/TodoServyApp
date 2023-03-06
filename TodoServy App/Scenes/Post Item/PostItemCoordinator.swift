//
//  PostItemCoordinator.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

open class PostItemFlowState: ObservableObject {
    @Binding var path: NavigationPath
    @Published var presentedItem: PostItemLink?
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

enum PostItemLink: Hashable, Identifiable {
    
    case save
    case addPic
    
    var id: String {
        String(describing: self)
    }
}

struct PostItemCoordinator<Content: View>: View {
    
    @ObservedObject var state: PostItemFlowState
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
        }
        .navigationDestination(for: PostItemLink.self, destination: linkDestination)
    }
    
    @ViewBuilder private func linkDestination(link: PostItemLink) -> some View {
        switch link {
        case .save:
            var viewModel = PostItemViewModel(path: state.$path)
            
            ImagePickerView(viewModel: viewModel)
            
        case .addPic:
            var viewModel = PostItemViewModel(path: state.$path)
            
            ImagePickerView(viewModel: viewModel)
            
        }
    }
}
