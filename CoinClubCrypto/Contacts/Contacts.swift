//
//  Contacts.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct Contacts: View {
    
    @Binding var backgroundColor:LinearGradient
    @Binding var searchLedger:String
    
    var body: some View {
        NavigationView {
            BookPage
                .navigationTitle("My Contacts")
                .navigationBarItems(trailing:
                    Button (action: {
 
                    }) {
                        Image(systemName: "plus")
                    }
                )
        }
    }
    
    //MARK: Bookpage
    var BookPage: some View {
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
                    Section("A"){
                        Text("test")
                        
                        Text("test")
                    }
                    Section("B"){
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
