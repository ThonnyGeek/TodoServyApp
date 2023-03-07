//
//  PostItemViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI
import Combine
import PhotosUI

final class PostItemViewModel: PostItemFlowState {
    
    
    
    // Text field validations variables
    @Published var isNameValid = true
    @Published var isCellphoneValid = true
    @Published var isAboutValid = true

    @Published var nameTextField: String = "" {
        willSet {
            if newValue.isEmpty {
                isNameValid = false
            } else {
                isNameValid = true
            }
        }
    }
    
    @Published var cellphoneTextField: String = "" {
        willSet {
            if newValue.isEmpty {
                errorLabel = "Este campo es requerido"
                isCellphoneValid = false
            } else {
                isCellphoneValid = newValue.isValidRegx(pattern: "^\\+(?:[0-9]?){6,14}[0-9]$")
                if !isCellphoneValid {
                    errorLabel = "Escribe un número de teléfono real"
                }
            }
        }
    }
    
    
    
    @Published var aboutTextField: String = "" {
        willSet {
            if newValue.isEmpty {
                isAboutValid = false
            } else {
                isAboutValid = true
            }
        }
    }
    
    @Published var errorLabel: String = "Este campo es requerido"
    
    // Image variables
    @Published var selectedImage: UIImage? {
        willSet {
            if selectedImage != nil {
                selectedImageIsNil = false
            } else {
                selectedImageIsNil = true
            }
        }
    }
    
    @Published var selectedImageIsNil: Bool = false
    @Published var isImagePickerDisplay = false
    
    // Tap action functions
    
    func didTapBackButton() {
        path.removeLast()
    }
    
    func didTapAddPicButton(onSuccess: @escaping () -> Void) {
        path.append(PostItemLink.addPic)
    }
    
    func didTapSaveButton(onSuccess: @escaping () -> Void) {
        if checkData() {
            onSuccess()
        }
    }
    
    // View functions
    
    func checkData() -> Bool {
        if selectedImage == nil {
            selectedImageIsNil = true
        }
        
        if nameTextField.isEmpty {
            isNameValid = false
        }
        
        if cellphoneTextField.isEmpty {
            isCellphoneValid = false
        }
        
        if aboutTextField.isEmpty {
            isAboutValid = false
        }
        
        if selectedImage == nil || nameTextField.isEmpty || cellphoneTextField.isEmpty || aboutTextField.isEmpty {
            return false
        } else {
            return true
        }
    }
}
