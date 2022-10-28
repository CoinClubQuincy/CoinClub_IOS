//
//  SendScreen.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/27/22.
//

import SwiftUI

struct Token: Identifiable {
    let id = UUID().uuidString
    let network: String
    let token: String
    var amount:Int
}

struct Send: Identifiable {
    let id = UUID().uuidString
    let self_address: String
    let send_address: String
    let amount:Int
    let Token:String
    let includeFee:Bool
}

struct SendScreen: View {
    
    @Binding var sendCrypto: Send
    
    var body: some View{
        Text(sendCrypto.Token)
        Text(sendCrypto.self_address)
        Text(sendCrypto.send_address)
        Text("\(sendCrypto.amount)")
    }
}

