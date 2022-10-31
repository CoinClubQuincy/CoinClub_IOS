//
//  Contacts.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI

struct Contacts: View {
    var NativeCoins: [String] = [
        "XDC", "XRP", "XLM" ,"ALGO","ETH"
    ]
    
    var ABCs:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M",
                         "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    @Binding var backgroundColor:LinearGradient
    @Binding var searchLedger:String
    @State var selfName:String = "Self"
    
    @State  var AddName:String = "contact Name"
    @State  var AddAddress:String = "contact Address"
    @State  var AddNet:String = "contact Network"
    @State  var AddToken:String = "contact Token"

    var body: some View {
        NavigationView {
            contactBook
                .navigationTitle("My Contacts")
                .navigationBarItems(
                    leading:
                        NavigationLink(
                            destination: viewSelf,
                            label: {
                                Image(systemName: "person.fill")
                            })
                    ,trailing:
                        NavigationLink(
                            destination: addContact,
                            label: {
                                Image(systemName: "plus")
                            })
        )}
    }
    //MARK: Bookpage
    var contactBook: some View {
        ZStack {
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
    
    //MARK: Add Contact
    var addContact: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                Circle()
                    .frame(
                        height: 100,
                        alignment: .trailing)
                    .padding(.trailing,290)
                TextField("Name", text: $AddName)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.blue)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                TextField("Address", text: $AddAddress)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.blue)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                TextField("Network", text: $AddNet)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.blue)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                TextField("Token", text: $AddToken)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.blue)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                TextField("Name'''", text: $AddName)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(20)
                    .foregroundColor(.blue)
                    .font(.headline)
                    .bold()
                    .padding(.horizontal)
                Spacer()
                
                Text("Add Contact")
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(30)
                
            }
        }
    }
    
    
    //MARK: Add Contact
    var viewSelf: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                Text("Self info")
            }
        }
    }
}
