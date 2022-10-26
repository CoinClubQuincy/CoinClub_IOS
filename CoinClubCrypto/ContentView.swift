//
//  ContentView.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/21/22.
//

import SwiftUI

struct ContentView: View {
    
    var NativeCoins: [String] = [
        "XDC", "XRP", "XLM" ,"Algo","l","3","4","5","6","7"
    ]
    
    var ABCs:[String] = [
    "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
    ]
    
    @State var selectTab:Int = 1
    @State var total:Int = 12345
    @State var selectOmniDex:Bool = false
    @State var searchContacts:String = ""
    @State var seachLedger:String = ""
    @State var traderMode:Bool = false
    
    @State var walletExpand: Bool = false
    
    @State var backgroundColor:LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("Prime1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    //MARK: Main App
    var body: some View {
        
            TabView(selection: $selectTab, content: {
                wallets.tabItem{
                    Image(systemName: "house.fill")
                    Text("Wallet")
                }
                .tag(0)
                
                Ledger.tabItem{
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("Ledger")
                    }
                    .tag(1)
                DApps.tabItem{
                        Image(systemName: "plus.app")
                        Text("DApps")
                    }
                    .tag(2)
                
                ContactBook.tabItem{
                        Image(systemName: "book.fill")
                        Text("Contacts")
                    }
                    .tag(3)
                
                Settings.tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(4)
                
            })
            .accentColor(.accentColor)
    }
    
    //MARK: Functions
    
    
    
    //MARK: Wallets
    var wallets: some View {
        
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                
                Text("$\(total)")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white)
                        .frame(width: .infinity, height: selectOmniDex ? 550:100)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .shadow(radius: 10)
                    

                    
                    Toggle("", isOn: $traderMode)
                        .padding(.trailing,selectOmniDex ? 45:0)
                        .padding(.bottom,selectOmniDex ? 470:0)
                        .opacity(selectOmniDex ? 100:0)
                    
                    VStack (alignment: .center){
                        Button(action: {
                            withAnimation(.default){
                                selectOmniDex.toggle()
                            }
                        }, label: {
                            VStack {
                                Image(systemName: "rectangle.2.swap")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30,height: 30, alignment: .top)
                                    .padding(.leading,selectOmniDex ?  30:0)
                                    .padding()
                                //.background(Color.black)
                            }
                            
                            //.background(Color.black)
                        if selectOmniDex{
                            Spacer()
                        }
                        })
                        if selectOmniDex{
                            Spacer()
                        }
                        
                        
                        //MARK: Token Swap DApp
                        if selectOmniDex{
                            
                            SWAP()
                        }
                    }
                }
                
                Spacer()
                
                ScrollView {
                    ScrollViewReader { proxy in
                    ForEach(0..<17){index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: walletExpand ? 580:100)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .shadow(radius: 10)
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 40)
                                        .foregroundColor(.white)
                                        .padding(.top,walletExpand ? 65:20)
                                    
                                    Text("XDC")
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                VStack {
                                    HStack {
                                        Button(action: {
                                            withAnimation(.spring()){
                                                walletExpand.toggle()
                                                proxy.scrollTo(index, anchor: .top)
                                            }
                                        }, label: {
                                            Image(systemName: "circle.grid.3x3.circle")
                                                .foregroundColor(.white)
                                        })
                                        
                                        Spacer()
                                        
                                        Text("Test wallet \(index)")
                                            .foregroundColor(.white)
                                            .frame(width: .infinity, alignment: .center)
                                            .font(.title2)
                                            .padding(.top,5)
                                            .bold()
                                        
                                        Spacer()
                                        Spacer()
                                        
                                        Image(systemName: "paperplane.fill")
                                            .foregroundColor(.blue)
                                    }
                                    
                                    
                                    HStack {
                                        Spacer()
                                        Text("xdc76f33784f9dcd73...bee267a70f")
                                            .background(Color.blue)
                                            .cornerRadius(5)
                                            .foregroundColor(.white)
                                            .textSelection(.enabled)
                                        
                                        Image(systemName: "qrcode")
                                            .foregroundColor(.blue)
                                    }
                                    
                                   Spacer()
                                    
                                    
                                    Text("$15,245")
                                        .foregroundColor(.white)
                                        .padding(.leading,walletExpand ?  100:220)
                                        .font(walletExpand ? .largeTitle:.title2)
                                        .bold()
                                    
                                }
                                .padding(.bottom,5)
                                //.background(Color.green)
                            }
                            .padding(.leading, 35)
                            .padding(.trailing, 35)
                            
                        }
                        .id(index)
                    }
                    }
                }
                
                //MARK: OmniDex Wallet Bar
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
    }
    
    //MARK: DApps
    var DApps: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            Text("DApps")
        }
    }
    
    //MARK: ContractBook
    var ContactBook: some View {
        
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
                TextField("Search...", text: $seachLedger)
                    .frame(width: .infinity, height: 20)
                    .padding(15)
                    .foregroundColor(.white)
                    .background(Color.gray)
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
    
    //MARK: Ledger
    var Ledger: some View {
        NavigationView {
            LedgerView
                .navigationTitle("Ledger History")
                .navigationBarItems(trailing:
                    Button (action: {
 
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    }
                )
        }
    }
    
    var LedgerView: some View {
        ZStack{
            backgroundColor
                .ignoresSafeArea(.all)
            
            VStack {
                TextField("Search...", text: $seachLedger)
                    .frame(width: .infinity, height: 20)
                    .padding(15)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    
                    
                List{
                    Section("Date"){
                        Text("test")
                        
                        Text("test")
                    }
                    Text("test")
                    Text("test")
                    Text("test")
                }
                .listStyle(GroupedListStyle())
                .cornerRadius(10)

                Spacer()
            }
            .padding()
        }
    }
    
    //MARK: Settings
    var Settings: some View {
            ZStack {
                backgroundColor
                    .ignoresSafeArea(.all)
                Text("Settings")
            }
    }
}

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


//MARK: Content View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
