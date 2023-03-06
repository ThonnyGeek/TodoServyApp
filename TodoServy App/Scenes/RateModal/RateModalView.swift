//
//  RateModalView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

struct RateModalView: View {
    
    @StateObject var viewModel: PostDetailViewModel
    
    @EnvironmentObject var businessData: BusinessData
        
    
//    var body: some View {
//        ZStack {
//            Colors.modalBackground.ignoresSafeArea()
//                .onTapGesture {
//                    viewModel.modalIsDisplayed = false
//                }
//
//            VStack (spacing: 30) {
//                Text("Agregar Calificación")
//                    .font(Font.OpenSans.openBold20)
//
//                HStack {
//
//                    ForEach(0..<businessData.business[viewModel.postId].stars.count) { index in
//                        Button {
//                            viewModel.didTapStar(index)
//                            print("Stars: \(businessData.business[viewModel.postId].stars)")
//
//                            businessData.business[viewModel.postId].stars = Functs.starst(rate: index + 1)
//
//                            print("Stars: \(businessData.business[viewModel.postId].stars), name: \(businessData.business[viewModel.postId].name)")
//                        } label: {
//                            Image(systemName: businessData.business[viewModel.postId].stars[index])
//                                .resizable()
//                                .foregroundColor(Colors.starsFillColor)
//                                .frame(width: 40, height: 40)
//                                .scaledToFit()
//                        }
//                    }
//                }
//
//                Button {
//                    businessData.business[viewModel.postId].rate += 1
//                    viewModel.didTapSaveButton()
//                } label: {
//                    Text("Guardar")
//                        .font(Font.OpenSans.openBold20)
//                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 50)
//                        .foregroundColor(.white)
//                        .background(Colors.buttonSaveColor)
//                        .cornerRadius(20)
//                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
//                }
//
//            }
//            .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)
//            .background(.white)
//            .cornerRadius(25)
//        }
//        .environmentObject(businessData)
//    }
    
//    var starsInModal = ["star", "star", "star", "star", "star"]
    
    var body: some View {
        ZStack {
            Colors.modalBackground.ignoresSafeArea()
                .onTapGesture {
                    viewModel.modalIsDisplayed = false
                }
            
            VStack (spacing: 30) {
                Text("Agregar Calificación")
                    .font(Font.OpenSans.openBold20)
                
                HStack {
                    
                    ForEach(0..<viewModel.starsInModal.count) { index in
                        Button {
                            viewModel.didTapStar(index)
                    
                            businessData.business[viewModel.postId].stars = Functs.starst(rate: index + 1)
                            
                            viewModel.starsInModal = Functs.starst(rate: index + 1)
                            
                            print("Stars: \(businessData.business[viewModel.postId].stars), name: \(businessData.business[viewModel.postId].name)")
                        } label: {
                            Image(systemName: viewModel.starsInModal[index])
                                .resizable()
                                .foregroundColor(Colors.starsFillColor)
                                .frame(width: 40, height: 40)
                                .scaledToFit()
                        }
                    }
                }
                
                Button {
                    businessData.business[viewModel.postId].rate += 1
                    viewModel.didTapSaveButton()
                } label: {
                    Text("Guardar")
                        .font(Font.OpenSans.openBold20)
                        .frame(width: UIScreen.main.bounds.width * 0.5, height: 50)
                        .foregroundColor(.white)
                        .background(Colors.buttonSaveColor)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 5, x: 3, y: 3)
                }

            }
            .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3)
            .background(.white)
            .cornerRadius(25)
        }
        .environmentObject(businessData)
    }
    
//    @ViewBuilder private func content() -> some View
}

struct RateModalView_Previews: PreviewProvider {
    static var previews: some View {
        RateModalView(viewModel: PostDetailViewModel(path: .constant(.init()), text: "", postId: 0))
    }
}
