//
//  PostImageView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 5/03/23.
//

import SwiftUI

struct PostImageView: View {
    
    var image: UIImage
    
    var body: some View {
        ZStack {
            HStack {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom, 40)
    }
}

struct PostImageView_Previews: PreviewProvider {
    static var previews: some View {
        PostImageView(image: UIImage(named: "myPic")!)
    }
}
