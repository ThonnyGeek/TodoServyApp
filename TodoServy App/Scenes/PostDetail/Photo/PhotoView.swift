//
//  PhotoView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

struct PhotoView: View {
    @StateObject var viewModel: PostDetailViewModel
    
    @EnvironmentObject var businessData:  BusinessData
    
    var body: some View {
        ZStack {
            //Main Pic
            Image(uiImage: businessData.business[viewModel.postId].picture)
                .resizable()
                .scaledToFit()
            
            VStack {
                // Back Button
                Button {
                    viewModel.didTabBackButton()
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 35, height: 35)
                        .padding(.leading, 30)
                        .padding(.top, 40)
                }
                .frame(width: viewModel.sizes.width, height: viewModel.sizes.height, alignment: .topLeading)
            }
        }
        .navigationBarBackButtonHidden()
        .environmentObject(businessData)
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView(viewModel: PostDetailViewModel(path: .constant(.init()), text: "", postId: 0))
            .environmentObject(BusinessData())
    }
}
