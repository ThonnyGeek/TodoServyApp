//
//  ImagePickerView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 5/03/23.
//

import Foundation
import SwiftUI

struct ImagePickerView: View {
    
    @StateObject var viewModel: PostItemViewModel
    
    var body: some View {
        ImagePickerCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack {
            ImagePicker(selectedImage: $viewModel.selectedImage, sourceType: .camera)
        }
    }
}
