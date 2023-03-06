//
//  ImagePickerCoordinator.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

struct ImagePickerCoordinator<Content: View>: View {
    
    @ObservedObject var state: PostItemViewModel
    let content: () -> Content
    
    var body: some View {
        content()
    }
}

