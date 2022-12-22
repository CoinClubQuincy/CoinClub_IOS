//
//  ContentView.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/21/22.
//

import SwiftUI


struct ContentView: View {
    
    @State var name: String = ""

    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Contacts_.entity(), sortDescriptors: [])
     var products: FetchedResults<Contacts_>
    
    
    func addContact() {
        withAnimation {
            let newItem = Contacts_(context: viewContext)
            newItem.name = "Q"

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { Contacts_[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
    
    
    @State var selectTab:Int = 0
    @State var total:Int = 12345
    @State var selectOmniDex:Bool = false
    @State var searchContacts:String = ""
    @State var searchLedger:String = ""
    @State var traderMode:Bool = false
    
    @State var walletExpand: Bool = false
    @State var showSendScreen:Bool = false
    
    @State var sendScreen: Send = Send(
        self_address: "0x0000000000000000000000000000000000000000",
        send_address: "0x0000000000000000000000000000000000000000",
        amount: 0,
        Token: "N/A",
        includeFee: false)
    
    @State var backgroundColor:LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("Prime1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //MARK: Main App
    var body: some View {
            TabView(selection: $selectTab, content: {
                //MARK: Wallets
                Wallets(
                    backgroundColor: $backgroundColor,
                    total: $total,
                    selectOmniDex: $selectOmniDex,
                    traderMode: $traderMode,
                    walletExpand: $walletExpand,
                    sendScreen: $sendScreen,
                    showSendScreen: $showSendScreen)
                    .tabItem{
                    Image(systemName: "house.fill")
                    Text("Wallet")}
                    .tag(0)
                //MARK: Ledger
                Ledger(backgroundColor: $backgroundColor, searchLedger: $searchLedger)
                    .tabItem{
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Ledger")}
                        .tag(1)
                //MARK: DAppStore
                DAppStore(backgroundColor: $backgroundColor)
                    .tabItem{
                        Image(systemName: "qrcode")
                        Text("DApps")}
                        .tag(2)
                //MARK: Contacts
                Contacts(backgroundColor: $backgroundColor, searchLedger: $searchLedger, products: products)
                    .tabItem{
                        Image(systemName: "book.fill")
                        Text("Contacts")}
                        .tag(3)
                //MARK: Settings
                Settings(traderMode: $traderMode, backgroundColor: $backgroundColor)
                    .tabItem{
                        Image(systemName: "gearshape.circle")
                        Text("Settings")}
                        .tag(4)
            })
            .accentColor(.white)
    }
}
//MARK: Content View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
