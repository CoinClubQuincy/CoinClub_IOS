//
//  SWAP.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/27/22.
//

import SwiftUI

//MARK: SWAP DApp
struct SWAP: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 70, alignment: .center)
                HStack {
                    Text("XDC")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("amount")
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .padding(.leading,100)
                .padding(.trailing,100)
            }
            
            Image(systemName: "arrow.triangle.swap")
                .frame(width: .infinity, height: 20)
                .padding(20)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 70, alignment: .center)
                
                HStack {
                    HStack {
                        Text("PLI")
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Text("amount")
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                        
                            .background(Color.gray)
                            .cornerRadius(10)
                    }
                    .padding(.leading,100)
                    .padding(.trailing,100)
                }
            }
            Spacer()
            
            ZStack{
                VStack {
                    Text("SWAP")
                        .frame(width: 100, height: 50, alignment: .center)
                        .foregroundColor(.blue)
                        .background(Color.black)
                        .cornerRadius(20)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 70, height: 40, alignment: .center)
                        Text("DEX")
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            
            HStack {
                Image(systemName: "arrow.down.app")
                Spacer()
                Image(systemName: "gear")
            }
            .padding(.trailing,30)
            .padding(.leading,30)
            .padding(.bottom,10)
        }
    }
}

struct SWAP_Previews: PreviewProvider {
    static var previews: some View {
        SWAP()
    }
}
