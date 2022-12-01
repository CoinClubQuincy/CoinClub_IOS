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
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                HStack {
                    TextField("Search...", text: $searchBar)
                        .frame(height: 50)
                        .background(Color(.gray))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.leading)
                        .shadow(radius: 6)
                    
                    Image(systemName: "qrcode")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40,height: 40, alignment: .center)
                        .padding(.trailing,10)
                        
                }
                
                
                HStack {
                    
                    Button(action: {}, label: {
                        Image("storeLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    })
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .padding(.top)
        }
    }
}
