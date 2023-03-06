//
//  PostDetailView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI

struct PostDetailView: View {
    
    @StateObject var viewModel: PostDetailViewModel
    
    @StateObject var businessData = BusinessData()
    
    var body: some View {
        PostDetailCoordinator(state: viewModel, content: content)
            .onAppear{
                _ = businessData.business.map {
                    businessData.business[$0.id].stars = viewModel.starst(rate: $0.rate)
                }
            }
    }
    
    @ViewBuilder private func content() -> some View {
            ZStack {
                
                VStack {
                    Image("orangeIphone")
                        .resizable()
                        .scaledToFit()
                }
                .frame(height: viewModel.sizes.height * 0.9, alignment: .top)
                .onTapGesture {
                    viewModel.didTapPhoto()
                }

                VStack {
                    Button {
                        viewModel.didTabBackButton()
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 35, height: 35)
                            .padding(.leading, 30)
                            .padding(.top, 30)
                    }
                    .frame(width: viewModel.sizes.width, height: viewModel.sizes.height * 0.2, alignment: .bottomLeading)

                    VStack {
                        InfoView(viewModel: viewModel)
                            .background {
                                Colors.detailBackground.ignoresSafeArea()
                            }
                            .frame(height: viewModel.sizes.height * 0.9)
                    }
                    .frame(width: viewModel.sizes.width, height: viewModel.sizes.height, alignment: .bottom)
                }
                
                if viewModel.modalIsDisplayed {
                    RateModalView(viewModel: viewModel)
                }
            }
        .navigationBarBackButtonHidden()
        .preferredColorScheme(.light)
        .background(.white)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(viewModel: PostDetailViewModel(path: .constant(.init()), text: "", postId: 0))
    }
}
