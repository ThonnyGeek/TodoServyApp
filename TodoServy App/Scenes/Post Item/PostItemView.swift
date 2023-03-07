//
//  PostItemView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI
import PhotosUI

struct PostItemView: View {
    
    @StateObject var viewModel: PostItemViewModel
    
    @EnvironmentObject var businessData:  BusinessData
    
    @FocusState var isNameFocusedField: Bool
    @FocusState var isCellphoneFocusedField: Bool
    @FocusState var isAboutFocusedField: Bool
    
    var body: some View {
        PostItemCoordinator(state: viewModel, content: content)
            .environmentObject(businessData)
    }
    
    @ViewBuilder private func content() -> some View {
        ZStack (alignment: .bottom){
            
            ScrollView {
                
                VStack (spacing: 40) {
                    // Main section
                    VStack (spacing: 30) {
                        
                        // Title section
                        Text("Crear un nuevo negocio")
                            .font(Font.OpenSans.openTitle32)
                        
                        // Name section
                        TextField("El nombre de tu negocio", text: $viewModel.nameTextField)
                            .textFieldStyle(ServyTextFieldView(isError: !viewModel.isNameValid, errorLabel: "Este campo es requerido", title: "Nombre"))
                            .focused($isNameFocusedField)
                            .onTapGesture {
                                isNameFocusedField = true
                            }
                        
                        // Cellphone section
                        TextField("+57 319 1231212", text: $viewModel.cellphoneTextField)
                            .textFieldStyle(ServyCellphoneFieldView(isError: !viewModel.isCellphoneValid, errorLabel: viewModel.errorLabel, title: "Teléfono"))
                            .focused($isCellphoneFocusedField)
                            .keyboardType(.phonePad)
                            .onTapGesture {
                                isCellphoneFocusedField = true
                            }
                        
                        // About section
                        MultilineTextFieldView(txt: $viewModel.aboutTextField, title: "Acerca de", isError: !viewModel.isAboutValid)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.15, alignment: .topLeading)
                            .focused($isAboutFocusedField)
                            .onTapGesture {
                                isAboutFocusedField = true
                            }
                        
                        VStack (alignment: .leading) {
                            // Open Camera to take pic
                            Button {
                                quiteFocusedItems()
                                viewModel.isImagePickerDisplay.toggle()
                            } label: {
                                Image(systemName: "camera.fill")
                                Text("Tomar foto")
                            }
                            .padding(.vertical, 25)
                            
                            // Image section
                            if viewModel.selectedImage != nil {
                                VStack {
                                    HStack {
                                        Button {
                                            withAnimation(.easeOut(duration: 0.5)) {
                                                viewModel.selectedImage = nil
                                            }
                                        } label: {
                                            Image(systemName: "trash.circle")
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(Colors.textFieldBorderErrorColor)
                                        }

                                        Spacer()
                                    }
                                    
                                    PostImageView(image: viewModel.selectedImage!)
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.35)
                                .onAppear{
                                    viewModel.selectedImageIsNil = false
                                }
                            } else {
                                VStack {
                                    if viewModel.selectedImageIsNil {
                                        HStack {
                                            Image(systemName: "xmark.app.fill")
                                                .foregroundColor(.red)
                                            
                                            Text("Este campo es requerido")
                                                .foregroundColor(.red)
                                            
                                            Spacer()
                                        }
                                        .padding(.top, 5)
                                    }
                                    
                                    Image(systemName: "photo.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.gray)
                                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.4)
                            }
                        }
                        .frame(width: Sizes.width * 0.8, alignment: .leading)
                        
                    }
                    .frame(alignment: .top)
                    .toolbar {
                        // Keyboard Top Button
                        ToolbarItemGroup(placement: .keyboard) {
                            Button("Listo") {
                                quiteFocusedItems()
                            }
                            
                        }
                    }
                }
                .frame(minHeight: Sizes.height * 1.05, alignment: .top)
                .fullScreenCover(isPresented: $viewModel.isImagePickerDisplay) {
                    // Show camera
                    CameraView(selectedImage: $viewModel.selectedImage, sourceType: .camera)
                        .ignoresSafeArea()
                }
                .padding(.top, 40)
                .navigationBarBackButtonHidden()
                .preferredColorScheme(.light)
                .background()
            }
            .scrollIndicators(.hidden)
            .padding(.top, 50)
            
            // Background = Top and Bottom components
            VStack {
                
                //Back button
                Button {
                    quiteFocusedItems()
                    DispatchQueue.main.async {
                        viewModel.didTapBackButton()
                    }
                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 35, height: 35)
                        .padding(.leading, 30)
                        .padding(.top, 20)
                }
                .frame(width: Sizes.width, alignment: .leading)
                
                Spacer()
                
                // Save button
                Button {
                    quiteFocusedItems()
                    viewModel.didTapSaveButton() {
                        // MARK: Here
                        businessData.business.append(Business(id: UUID(), name: viewModel.nameTextField, about: viewModel.aboutTextField, cellphone: viewModel.cellphoneTextField, picture: viewModel.selectedImage!, rate: 0, stars: ["star", "star", "star", "star", "star"]))
                        viewModel.didTapBackButton()
                    }
                } label: {
                    Text("Guardar")
                        .font(Font.OpenSans.openBold20)
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                        .foregroundColor(.white)
                        .background(Colors.buttonRatingColor)
                        .clipShape(Capsule())
                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        .padding((isNameFocusedField || isCellphoneFocusedField || isAboutFocusedField) ? 10 : 0)
                    
                }
                .padding(.bottom, 20)
            }
        }
        .onTapGesture {
            quiteFocusedItems()
        }
        .environmentObject(businessData)
    }
    
    func quiteFocusedItems() {
        if isNameFocusedField {
            isNameFocusedField = false
        }
        
        if isCellphoneFocusedField {
            isCellphoneFocusedField = false
        }
        
        if isAboutFocusedField {
            isAboutFocusedField = false
        }
    }
}

struct PostItemView_Previews: PreviewProvider {
    static var previews: some View {
        PostItemView(viewModel: PostItemViewModel(path: .constant(.init())))
            .ignoresSafeArea()
            .environmentObject(BusinessData())
    }
}
