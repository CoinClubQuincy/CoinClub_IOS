//
//  Contacts.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/28/22.
//

import SwiftUI
import CoreData
 
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
 
    init() {
        
        container = NSPersistentContainer(name: "Contacts_")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
        
    }
}

 
struct Contacts: View {
        
//        @State var name: String = ""
//
//        @Environment(\.managedObjectContext) private var viewContext
//
//        @FetchRequest(entity: Contacts_.entity(), sortDescriptors: [])
//        private var products: FetchedResults<Contacts_>
//
        
        var NativeCoins: [String] = [
            "XDC", "XRP", "XLM","ETH"
        ]
        
        var ABCs:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M",
                             "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
        
        @Binding var backgroundColor:LinearGradient
        @Binding var searchLedger:String
        @State var selfName:String = "Self"
        
        @State  var AddName:String = ""
        @State  var AddAddress:String = ""
        
        @State  var AddToken:String = ""
        @State var products: FetchedResults<Contacts_>
        
        var body: some View {
            NavigationView {
                contactBook
                    .navigationTitle("My Contacts")
                    .navigationBarItems(
                        leading:
                            NavigationLink(
                                destination: viewSelf
                                    .navigationTitle("My Wallets")
                                ,
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
                        ForEach(products) { product in
                            HStack {
                                Text(product.name ?? "Not found")
                                Spacer()
                                Text(product.name ?? "Not found")
                            }
                        }
//                        Section("A"){
//                            Text("test")
//                            Text("test")
//                        }
//                        Section("B"){
//                            Text("test")
//                            Text("test")
//                            Text("test")
//                        }
                    }
                    .listStyle(GroupedListStyle())
                    .cornerRadius(10)
                    .listStyle(PlainListStyle())
                    
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
                    TextField("Name", text: $AddName)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(20)
                        .foregroundColor(.blue)
                        .font(.headline)
                        .bold()
                        .padding(.horizontal)
                    HStack() {
                        Circle()
                            .frame(height: 60)
                            .padding(.leading,10)
                        
                        TextField("Address", text: $AddAddress)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundColor(.blue)
                            .font(.headline)
                            .bold()
                            .padding(.trailing,20)
                    }
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black)
                            .cornerRadius(50)
                            .font(.headline)
                            .padding(.horizontal)
                    })
                    
                    
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
            NavigationView{
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
                            Section("XDC"){
                                Text("0x0000...0000")
                            }
                            Section("XRP"){
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
            .navigationTitle("My Contacts")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination: addWallet,
                        label: {
                            Image(systemName: "plus")
                        })
            )
        }
        
        var addWallet: some View {
            ZStack{
                backgroundColor
                    .ignoresSafeArea(.all)
                Text("Add wallet")
            }
        }
        
        struct addNetwork: View {
            //@State var addToken:[AnyView] = []
            @State  var AddNet:[String] = [""]
            var body: some View {
                VStack {
                    
                    HStack{
                        TextField("Network", text: $AddNet[0])
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .foregroundColor(.blue)
                            .font(.headline)
                            .bold()
                            .padding(.horizontal)
                        
                        Image(systemName: "circle.fill")
                            .padding()
                            .background(Color.white)
                            .cornerRadius(50)
                            .foregroundColor(.blue)
                            .font(.headline)
                            .bold()
                            .padding(.horizontal)
                    }
                    
                }
            }
        }
    }

