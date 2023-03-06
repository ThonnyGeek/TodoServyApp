//
//  TestView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI

//@main

struct TodoServy2_App: App {
    
    var body: some Scene {
        WindowGroup {
            TestView()
        }
    }
}

struct TestView: View {
    
//    @ObservedObject var viewModel: TestViewModel
    
    @StateObject var bsData = BusinessData()
    
    var txt = "Active"
    
    var body: some View {
        ZStack {
            VStack {
//                Text("SD")
                
                Text(txt)
                    .font(Font.OpenSans.openLight18)
                
                Text(txt)
                    .font(Font.OpenSans.openRegular16)
                
                Text(txt)
                    .font(Font.OpenSans.openSemiBold16)
                
                Text(txt)
                    .font(Font.OpenSans.openBold16)
                
                Text(txt)
                    .font(Font.OpenSans.openExtraBold16)
            }
        }
    }
}

final class TestViewModel: ObservableObject {
    @StateObject var bsData = BusinessData()
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

