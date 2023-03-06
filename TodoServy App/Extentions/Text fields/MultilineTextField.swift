//
//  MultilineTextField.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import UIKit
import SwiftUI

class MLFViewModel: ObservableObject {
    @Published var isError: Bool
    init(isError: Bool) {
        self.isError = isError
    }
}

struct MultilineTextFieldView: View {
    
    var isError: Bool
    
    @Binding var txt: String
    @State private var editing: Bool = false
    var title: String
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(title)
            
            MultilineTextField(txt: $txt, isError: isError)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.1)
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
    
    func strokeColor() -> Color {
        return isError ? Colors.textFieldBorderErrorColor : Colors.textFieldBorderColor
    }
    
    func strokeLineWidth() -> CGFloat {
        if isError { return 2 }
        return editing ? 2 : 0.5
    }
    
    func fontColor() -> CGFloat {
        return editing ? 2 : 0.5
    }
}

struct lsdklsd_Previews: PreviewProvider {
    static var previews: some View {
        MultilineTextFieldView(isError: true, txt: .constant(""), title: "Title")
    }
}

struct MultilineTextField: UIViewRepresentable {
    
    @Binding var txt: String
    @State private var editing: Bool = false
    var isError: Bool
    
    func makeCoordinator() -> MultilineTextField.Coordinator {
        return MultilineTextField.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MultilineTextField>) -> UITextView {
        let tview = UITextView()
        tview.isEditable = true
        tview.isUserInteractionEnabled = true
        tview.isScrollEnabled = true
        tview.text = "Cuéntanos sobre tu negocio"
        tview.font = .systemFont(ofSize: 16)
        tview.backgroundColor = UIColor(Colors.textFieldBackground)
        tview.textColor = UIColor(Colors.textFieldFontColor)
        tview.delegate = context.coordinator
        
        return tview
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        //
    }
    
    func textColor() -> CGFloat {
        return editing ? 2 : 0.5
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        
        var parent: MultilineTextField
        
        init(parent1: MultilineTextField) {
            self.parent = parent1
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.txt = textView.text
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            if self.parent.txt.isEmpty {            
                textView.text = ""
            }
            self.parent.txt = textView.text
            textView.textColor = UIColor(.black)
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "Cuéntanos sobre tu negocio"
                textView.textColor = UIColor(Colors.textFieldFontColor)
            }
        }
    }
}
