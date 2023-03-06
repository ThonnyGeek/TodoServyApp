//
//  PostDetailCoordinator.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI


open class PostDetailFlowState: ObservableObject {
    @Binding var path: NavigationPath

    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

enum PostDetailLink: Hashable, Identifiable {
    case link
    
    var id: String {
        String(describing: self)
    }
}

struct PostDetailCoordinator<Content: View>: View {
    
    @ObservedObject var state: PostDetailFlowState
    let content: () -> Content
    
    var body: some View {
        content()
        //                .sheet(item: <#$state.presentedItem#>, content: <#sheetContent#>)
            .navigationDestination(for: PostDetailLink.self, destination: linkDestination)
    }
    
    @ViewBuilder private func linkDestination(link: PostDetailLink) -> some View {
        let viewModel = PostDetailViewModel(path: state.$path, text: "", postId: 0)
        PhotoView(viewModel: viewModel)
            .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder private func sheetContent(item: PostDetailLink) -> some View {
        EmptyView()
    }
}
