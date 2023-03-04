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
case link
    
    var id: String {
        String(describing: self)
    }
}

struct BusinessListCoordinator<Content: View>: View {
    
    @ObservedObject var state: BusinessListFlowState
    let content: () -> Content
    
    var body: some View {
        NavigationStack(path: $state.path) {
            content()
//                .sheet(item: $state.presentedItem, content: sheetContent)
                .navigationDestination(for: BusinessListLink.self, destination: linkDestination)
        }
    }
    
    @ViewBuilder private func linkDestination(link: BusinessListLink) -> some View {
        EmptyView()
    }
    
    @ViewBuilder private func sheetContent(item: BusinessListLink) -> some View {
        EmptyView()
    }
}
