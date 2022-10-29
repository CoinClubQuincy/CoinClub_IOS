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
    
    var body: some View {
            ZStack {
                backgroundColor
                    .ignoresSafeArea(.all)
                VStack {
                    
                    Toggle("TraderMode", isOn: $traderMode)
                        .frame(width: .infinity)
                        //.background(Color.white)
                        .cornerRadius(20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Toggle("FaceID", isOn: $traderMode)
                        .frame(width: .infinity)
                        //.background(Color.white)
                        .cornerRadius(20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    Spacer()
                    
                    Toggle("Testnets", isOn: $traderMode)
                        .frame(width: .infinity)
                        //.background(Color.white)
                        .cornerRadius(20)
                        .padding(.leading,20)
                        .padding(.trailing,20)
                    
                    
                    Spacer()
                    
                    Text("Import Account")
                        .frame(width: .infinity, height: 40, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(5)
                    
                    Text("Export Account")
                        .frame(width: .infinity, height: 40, alignment: .center)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(5)
                }
            }
    }
}


