//
//  BusinessListView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI

struct BusinessListView: View {
    
    @StateObject var viewModel: BusinessListViewModel
    
    @StateObject var businessData = BusinessData()
    
    var body: some View {
        BusinessListCoordinator(state: viewModel, content: content)
            .environmentObject(businessData)
    }
    
    @ViewBuilder private func content() -> some View {
        NavigationView {
            ListRowView(viewModel: viewModel)
                .padding(.top, 25)
        }
        .environmentObject(businessData)
        .preferredColorScheme(.light)
        .toolbar {
            HStack {
                Text("Lista de negocios")
                    .font(Font.OpenSans.openTitle32)
                    .padding()
                
                Spacer()
                
                Button {
                    viewModel.openPostItemView()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .foregroundColor(viewModel.blue)
                        .frame(width: 35, height: 35)
                        .padding()
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct ListRowView: View {
    
    @StateObject var viewModel: BusinessListViewModel
    
    @EnvironmentObject var businessData: BusinessData

    var body: some View {
        ZStack {
            List(businessData.business) { buss in
                Section {
                    HStack {
                        VStack (alignment: .leading){
                            Text(buss.name)
                                .font(Font.OpenSans.openBold24)
                            
                            Text(buss.cellphone)
                                .font(Font.OpenSans.openSemiBold16)
                            
                            Text(buss.about)
                                .font(Font.OpenSans.openLight14)
                            
                            HStack {
                                ForEach(0..<5) { pepe in
                                    if businessData.business[buss.id].stars.isEmpty {
                                        Image(systemName: "star")
                                    } else {
                                        Image(systemName: businessData.business[buss.id].stars[pepe])
                                            .foregroundColor(Colors.starsFillColor)
                                    }
                                }
                                
                                Text("(\(buss.rate))")
                                    .font(Font.OpenSans.openSemiBold16)
                                
                                Text("(\(buss.id))")
                                    .font(Font.OpenSans.openSemiBold16)
                            }
                        }
                        .frame(width: Sizes.width * 0.6, height: Sizes.height * 0.1, alignment: .leading)
                        
                        Spacer()
                        
                        Image("orangeIphone")
                            .resizable()
                            .padding(10)
                            .background(.white)
                            .frame(width: Sizes.width * 0.20, height: Sizes.width * 0.20)
                            .cornerRadius(10)
                            .shadow(color: Colors.shadowGray, radius: 5, x: 0, y: 4)
                    }
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        viewModel.openPostDetail(itemId: buss.id)
                    }
                    .frame(width: Sizes.width * 0.9)
                    .padding(.vertical, 10)
                    
                    Divider()
                }
                .listSectionSeparator(.hidden)
            }
            .frame(width: Sizes.width)
            .listStyle(.inset)
        }
        .onAppear{
//            _ = businessData.business.map {
//                businessData.business[$0.id].stars = viewModel.starst(rate: $0.rate)
//            }
            Functs.fetchStars(businessData: businessData)
        }
    }
    
}

struct BusinessListView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessListView(viewModel: BusinessListViewModel())
    }
}
