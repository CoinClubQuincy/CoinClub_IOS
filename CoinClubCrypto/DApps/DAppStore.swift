//
//  DAppStore.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct DAppStore: View {
    @Binding var backgroundColor:LinearGradient
    @State var searchBar:String = ""
    
    let data = Array(1...60).map { "DApp Name \($0)" }
    let layout = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        
        NavigationView {
            ZStack {
                backgroundColor
                    .ignoresSafeArea(.all)
                    .navigationTitle("DApps")
                    .navigationBarItems(
                        leading:
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                            .foregroundColor(.white)
                        ,trailing:
                            NavigationLink(
                                destination: Text("Favorites")
                                .navigationTitle("Favorites")
                                ,label: {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                })
                    )
                VStack {
                    HStack {
                        TextField("Search...", text: $searchBar)
                            .frame(height: 50)
                            .padding(.leading)
                            .background(Color(.white))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.leading)
                            .shadow(radius: 6)
                        
                        
                        Button(action: {
                            
                        }, label: {
                            Image("CIML_Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 55,height: 55, alignment: .center)
                                .cornerRadius(10)
                                .padding(.trailing,10)
                        })
                    }
                    ScrollView {
                        LazyVGrid(columns: layout, spacing: 20){
                            ForEach(data, id: \.self){item in
                                    VStack {
                                        Button(action: {}, label: {
                                            Image("storeLogo")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 60)
                                                .cornerRadius(10)
                                                .shadow(radius: 10)
                                                .padding(5)
                                        })
                                        Text(item)
                                            .font(.footnote)
                                    }
                                    .overlay(
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 20,height: 20)
                                            .overlay(
                                                Text("2")
                                                    .font(.footnote)
                                                    .foregroundColor(.white)
                                            )
                                        , alignment: .topLeading
                                    )
//                                    .overlay(// check isverifired == true
//                                        Circle()
//                                            .fill(Color.green)
//                                            .frame(width: 20,height: 20)
//                                            .overlay(
//                                                Image(systemName: "checkmark.shield.fill")
//                                                    .font(.footnote)
//                                                    .foregroundColor(.white)
//                                            )
//                                        , alignment: .topTrailing
//                                    )

                            }
                        }
                        .padding(.top)
                    }
                    
                    
                    
                    /*
                    HStack {
                        VStack {
                            Button(action: {}, label: {
                                Image("storeLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(5)
                            })
                            Text("DApp Store")
                                .font(.footnote)
                        }
                        VStack {
                            Button(action: {}, label: {
                                Image("storeLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(5)
                            })
                            Text("DApp Store")
                                .font(.footnote)
                        }
                        
                        VStack {
                            Button(action: {}, label: {
                                Image("storeLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(5)
                            })
                            Text("DApp Store")
                                .font(.footnote)
                        }
                        
                        VStack {
                            Button(action: {}, label: {
                                Image("storeLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(5)
                            })
                            Text("DApp Store")
                                .font(.footnote)
                        }
                        
                        VStack {
                            Button(action: {}, label: {
                                Image("storeLogo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                    .padding(5)
                            })
                            Text("DApp Store")
                                .font(.footnote)
                        }
                        
                        
                        Spacer()
                    }
                    .padding()
                    */
                    Spacer()
                }
                .padding(.top)
                .padding(.horizontal)
            }
        }
    }
}
