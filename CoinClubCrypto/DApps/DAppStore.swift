//
//  DAppStore.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct DAppStore: View {
    @Binding var backgroundColor:LinearGradient
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            Text("DApps")
        }
    }
}
