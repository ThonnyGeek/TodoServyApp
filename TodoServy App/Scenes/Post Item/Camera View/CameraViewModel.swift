//
//  CameraViewModel.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import Foundation
import AVFoundation
import SwiftUI

final class CameraViewModel: CameraFlowState {

    @Published var images: [UIImage] = []
    
    @Published var picker = false
}


