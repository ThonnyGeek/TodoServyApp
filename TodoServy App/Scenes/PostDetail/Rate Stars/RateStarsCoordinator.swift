//
//  RateStarsCoordinator.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

open class RateStarsFlowState: ObservableObject {
    @Published var coverPath = NavigationPath()
}

//struct RateStarsCoordinator<Content: View>: View {
//    
//    @ObservedObject var state: RateStarsFlowState
//    let content: () -> Content
//    
//    var body: some View {
//        NavigationStack(path: $state.coverPath) {
//            content()
//        }
//    }
//}
