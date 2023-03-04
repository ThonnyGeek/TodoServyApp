//
//  BusinessListView.swift
//  TodoServy App
//
//  Created by Thony Gonzalez on 3/03/23.
//

import SwiftUI



struct BusinessListView: View {
    
    @StateObject var viewModel: BusinessListViewModel
    
    var body: some View {
        BusinessListCoordinator(state: viewModel, content: content)
    }
    
    @ViewBuilder private func content() -> some View {
        NavigationView {
            ListRowView(viewModel: viewModel)
                .padding(.top, 25)
        }
        .toolbar {
            HStack {
                Text("Lista de negocios")
                    .font(Font.OpenSans.openTitle)
                    .padding()
                
                Image(systemName: "plus.circle")
                    .resizable()
                    .foregroundColor(viewModel.blue)
                    .frame(width: 35, height: 35)
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }
    }
}

struct ListRowView: View {
    
    @StateObject var viewModel: BusinessListViewModel

    var body: some View {
        GeometryReader { geo in
            List(viewModel.bussiness) { buss in
                Section {
                    HStack {
                        VStack (alignment: .leading){
                            Text(buss.name)
                                .font(Font.OpenSans.openBold)
                            
                            Text(buss.cellphone)
                                .font(Font.OpenSans.openSemiBold)
                            
                            Text(buss.about)
                                .font(Font.OpenSans.openLight)
                            
                            HStack {
                                ForEach(0..<5) { pepe in
                                    Image(systemName: viewModel.bussiness[buss.id].stars[pepe])
                                }
                                
                                Text("(\(buss.rate))")
                                    .font(Font.OpenSans.openSemiBold)
                            }
                        }
                       
                        .frame(width: geo.size.width * 0.6, height: geo.size.height * 0.1)
                        
                        Spacer()
                        
                        Image("orangeIphone")
                            .resizable()
                            .padding(10)
                            .background(.white)
                            .frame(width: geo.size.width * 0.20, height: geo.size.width * 0.20)
                            .cornerRadius(10)
                            .shadow(color: viewModel.gray, radius: 8, x: 3, y: 3)
                    }
                    .listRowSeparator(.hidden)
                    Divider()
                }
                .listSectionSeparator(.hidden)
            }
            .frame(width: geo.size.width)
            .listStyle(.inset)
        }
        .onAppear{
            _ = viewModel.bussiness.map {
                viewModel.bussiness[$0.id].stars = viewModel.starst(rate: $0.rate)
            }
        }
    }
    
}

struct BusinessListView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessListView(viewModel: BusinessListViewModel())
    }
}
