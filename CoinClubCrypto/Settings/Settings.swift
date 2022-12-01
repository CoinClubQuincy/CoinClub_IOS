//
//  Settings.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct Settings: View {
    
    @Binding var traderMode:Bool
    @Binding var backgroundColor:LinearGradient
    
    @State var mainnet:Bool = true
    @State var privateNetwork:Bool = true
    @State var faceID:Bool = false
    
    var body: some View {
        NavigationView {
        ZStack{
            backgroundColor
                .ignoresSafeArea(.all)
            HStack {
                Image(systemName: "livephoto")
                    .foregroundColor(.red)
                Spacer()
            }
            .ignoresSafeArea(.all)
            
            
                VStack {
                    List{
                        Section("Networks"){
                            HStack {
                                NavigationLink {
                                    Text("View All FIAT")
                                } label: {
                                    Image(systemName: "dollarsign.circle.fill")
                                    Text("USD")
                                }
                            }

                            HStack {
                                Image(systemName: "network")
                                Toggle("Testnet", isOn: $mainnet)
                            }
                            HStack {
                                Image(systemName: "network.badge.shield.half.filled")
                                Toggle("Private Net", isOn: $privateNetwork)
                            }
                            HStack {
                                Text("Blockchains")
                            }
                        }
                        
                        Section("Security"){
                            HStack {
                                Image(systemName: "faceid")
                                Toggle("Face ID", isOn: $faceID)
                            }
                        }
                        Section("Versions"){
                            HStack {
                                Text("CoinClub")
                                Spacer()
                                Text("V1.0.0")
                            }
                            HStack {
                                Text("CIML")
                                Spacer()
                                Text("V1.0.0")
                            }
                        }
                        
                        
                        Section("Accounts"){
                            HStack {
                                NavigationLink {
                                    Text("Import")
                                } label: {
                                    Image(systemName: "square.and.arrow.down")
                                    Text("Import")
                                }
                            }
                            HStack {
                                NavigationLink {
                                    Text("Export")
                                } label: {
                                    Image(systemName: "square.and.arrow.up")
                                    Text("Export")
                                }
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .cornerRadius(10)

                    Spacer()
                }
                .navigationTitle("Settings")
                .padding()
            }
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: Text("Test")
                            .navigationTitle("More Settings")
                        ,
                        label: {
                            Image(systemName: "gear")
                                .foregroundColor(.black)
                        })
            )}
    }
}


