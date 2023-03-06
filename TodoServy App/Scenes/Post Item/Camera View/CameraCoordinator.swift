//
//  CameraCoordinator.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI
import AVFoundation

open class CameraFlowState: ObservableObject {
    @Binding var path: NavigationPath
    
//    @Published var isTaken = false
//    
//    
//    
//    @Published var alert = false
    
    init(path: Binding<NavigationPath>) {
        _path = path
    }
}

enum CameraLink: Hashable, Identifiable {
case link
    
    var id: String {
        String(describing: self)
    }
}

struct CameraViewCoordinator<Content: View>: View {
    
    @ObservedObject var state: CameraFlowState
    let content: () -> Content
    
    var body: some View {
        content()
//                .sheet(item: <#$state.presentedItem#>, content: <#sheetContent#>)
            .navigationDestination(for: CameraLink.self, destination: linkDestination)
    }
    
    @ViewBuilder private func linkDestination(link: CameraLink) -> some View {
        EmptyView()
    }
}
