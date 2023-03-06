//
//  CameraView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

struct CameraView: View {
    
    @StateObject var viewModel: CameraViewModel
    
    @State var sourceType: UIImagePickerController.SourceType?
    @State var selectedImage: UIImage?
    @State var isImagePickerDisplay = false
    
    var body: some View {
        CameraViewCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        NavigationView {
            VStack {
                
                if self.selectedImage != nil {
                    Image(uiImage: self.selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                } else {
                    Image(systemName: "snow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                }
                
                Button("Camera") {
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                }.padding()
                
//                Button("photo") {
//                    self.sourceType = .photoLibrary
//                    self.isImagePickerDisplay.toggle()
//                }.padding()
            }
            .navigationBarTitle("Demo")
            .sheet(isPresented: self.$isImagePickerDisplay) {
//                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
//                ImagePicker(images: $viewModel.images, picker: $viewModel.picker)
//                ImagePicker(viewModel: <#T##ImagePickerViewModel#>)
            }
            
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(viewModel: CameraViewModel(path: .constant(.init())))
    }
}
