//
//  Ledger.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct Ledger: View {

    @Binding var backgroundColor:LinearGradient
    @Binding var searchLedger:String
    
    var body: some View {
        NavigationView {
            LedgerView
                .navigationTitle("Ledger History")
                .navigationBarItems(trailing:
                    Button (action: {
 
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    })
        }
    }
    var LedgerView: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                TextField("Search...", text: $searchLedger)
                    .frame(width: .infinity, height: 20)
                    .padding(15)
                    .foregroundColor(.white)
                    .background(Color.white)
                    .cornerRadius(10)
                    
                List{
                    Section("mm/dd/yyyy"){
                        Text("test")
                        
                        Text("test")
                    }
                    Section("mm/dd/yyyy"){
                        Text("test")
                        Text("test")
                        Text("test")
                    }
                }
                .listStyle(GroupedListStyle())
                .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
    }
}

