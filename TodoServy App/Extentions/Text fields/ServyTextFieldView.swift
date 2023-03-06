//
//  ServyTextFieldView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 5/03/23.
//

import SwiftUI

struct ServyTextFieldView: TextFieldStyle {
    var isError: Bool
    var errorLabel: String = ""
    @State private var editing: Bool = false
    var title: String
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            VStack (alignment: .leading) {
                Text(title)
                    .font(Font.OpenSans.openRegular16)
                
                configuration
                    .padding(10)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                    .background(Colors.textFieldBackground)
                    .border(strokeColor(), width: strokeLineWidth())
                
                if isError {
                    HStack {
                        Image(systemName: "xmark.app.fill")
                            .foregroundColor(.red)
                        Text("Este campo es requerido")
                            .foregroundColor(.red)
                    }
                    .padding(.top, 5)
                }
            }
        }
    }
    
    func strokeColor() -> Color {
        return isError ? Colors.textFieldBorderErrorColor : Colors.textFieldBorderColor
    }
    
    func strokeLineWidth() -> CGFloat {
        if isError { return 2 }
        return editing ? 2 : 0.5
    }
}

struct ServyTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            TextField("", text: .constant(""))
                .textFieldStyle(ServyTextFieldView(isError: false
                                                   , title: "Télefono"))
        }
    }
}
