//
//  InfoView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 4/03/23.
//

import SwiftUI

struct InfoView: View {
    
    @StateObject var viewModel: PostDetailViewModel
    
    @EnvironmentObject var businessData:  BusinessData
    
    var body: some View {
        ScrollView {
            VStack (spacing: 25) {
                VStack (alignment: .leading, spacing: 25) {
                    Text(businessData.business[viewModel.postId].name)
                        .font(Font.OpenSans.openBold24)
                    
                    Text(businessData.business[viewModel.postId].about)
                        .font(Font.OpenSans.openLight18)
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                
                Divider()
                
                VStack (alignment: .leading, spacing: 25) {
                    Text("Número de teléfono")
                        .font(Font.OpenSans.openSemiBold20)
                    
                    Text(businessData.business[viewModel.postId].cellphone)
                        .font(Font.OpenSans.openSemiBold20)
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .leading)
                
                Divider()
                
                VStack {
                    VStack (spacing: 20) {
                        Text("Calificación")
                            .font(Font.OpenSans.openSemiBold20)
                            .frame(width: viewModel.sizes.width * 0.9, alignment: .leading)
                        
                        HStack {
                            ForEach(0..<$businessData.business[viewModel.postId].stars.count, id: \.self) { pepe in
                                Image(systemName: businessData.business[viewModel.postId].stars[pepe])
                                    .resizable()
                                    .foregroundColor(Colors.starsFillColor)
                                    .frame(width: 40, height: 40)
                                    .scaledToFit()
                            }
                            
                            Text("(\(businessData.business[viewModel.postId].rate))")
                                .font(Font.OpenSans.openSemiBold32)
                                .padding()
                        }
                    }
                    
                    VStack (spacing: 20) {
                        Button {
                            viewModel.modalIsDisplayed.toggle()
                        } label: {
                            Text("Agregar una calificación")
                                .font(Font.OpenSans.openBold20)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                                .foregroundColor(.white)
                                .background(Colors.buttonRatingColor)
                                .clipShape(Capsule())
                                .shadow(color: .gray, radius: 5, x: 3, y: 3)
                        }
                        
                        Button {
                            viewModel.didTapDeleteBusiness() {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    businessData.business.remove(at: viewModel.postId)
                                }
                            }
                        } label: {
                            Text("Eliminar negocio")
                                .font(Font.OpenSans.openBold20)
                                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.05)
                                .foregroundColor(.white)
                                .background(Colors.buttonDeleteColor)
                                .clipShape(Capsule())
                                .shadow(color: .gray, radius: 5, x: 3, y: 3)
                            
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9)
                
            }
            .frame(height: viewModel.sizes.height * 0.65)
        }
        .frame(height: viewModel.sizes.height * 0.65
               , alignment: .bottom)
        .environmentObject(businessData)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(viewModel: PostDetailViewModel(path: .constant(.init()), text: "", postId: 0))
            .environmentObject(BusinessData())
    }
}
