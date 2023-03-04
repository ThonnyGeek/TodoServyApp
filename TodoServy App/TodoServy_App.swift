//
//  TodoServy_App.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI

@main
struct TodoServy_App: App {
    
    var body: some Scene {
        WindowGroup {
            BusinessListView(viewModel: BusinessListViewModel())
        }
    }
}
