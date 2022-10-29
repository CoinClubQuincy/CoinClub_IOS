//
//  OmniBarWallet.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct OmniBarWallet: View {
    
    @Binding var backgroundColor:LinearGradient
    @Binding var selectOmniDex:Bool
    
    var body: some View {
    ZStack{
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.green)
            .frame(width: .infinity, height: selectOmniDex ? 110:0)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .padding(.bottom, selectOmniDex ? 60:0)
        HStack {
            VStack {
                Circle()
                    .frame(width:selectOmniDex ?  50:0 , height: selectOmniDex ? 50:0, alignment: .trailing)
                Text("XDC")
            }
            .padding(.bottom, selectOmniDex ? 55:0)
            .padding(.leading, selectOmniDex ? 30:0)
            .shadow(radius: 10)
            .opacity(selectOmniDex ? 100:0)
            
            ZStack{
                VStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 310, height: selectOmniDex ? 50:0)
                        .padding(.bottom,5)
                    HStack {
                        Text("xdc76f33784...e267a70f")
                        Image(systemName: "equal.circle")
                        
                    }
                    .padding(.bottom,selectOmniDex ? 55:0)
                    .frame(width: 250, height: selectOmniDex ? 50:0)
                    .opacity(selectOmniDex ? 100:0)
                    .animation(.easeInOut)
                }
            }
            Spacer()
            }
        }
    }
}
