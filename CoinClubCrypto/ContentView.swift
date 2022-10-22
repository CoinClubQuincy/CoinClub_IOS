//
//  ContentView.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 10/21/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var fruit: [String] = [
        "apple", "banna", "peach" ,"1","2","3","4","5","6","7"
    ]
    
    @State var selectTab:Int = 0
    @State var total:Int = 123456543
    @State var selectOmniDex:Bool = false
    
    @State var backgroundColor:LinearGradient = LinearGradient(gradient: Gradient(colors: [Color.blue, Color("Prime1")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    //MARK: Main App
    var body: some View {
        
            TabView(selection: $selectTab, content: {
                wallets.tabItem{
                    Image(systemName: "house.fill")
                    Text("Wallet")
                }
                .tag(0)
                
                DApps.tabItem{
                        Image(systemName: "applescript.fill")
                        Text("DApps")
                    }
                    .tag(1)
                
                ContactBook.tabItem{
                        Image(systemName: "book.fill")
                        Text("Contact Book")
                    }
                    .tag(2)
                
                Settings.tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(2)
                
            })
            .accentColor(.green)
    }
    
    //MARK: Functions
    
    
    
    //MARK: Wallets
    var wallets: some View {
        
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            VStack {
                
                Text("\(total)")
                    .foregroundColor(.white)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.white)
                        .frame(width: .infinity, height: selectOmniDex ? 530:100)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .shadow(radius: 10)
                    
                    VStack {
                        Text("Token Exchange")
                            .frame(width: .infinity,height: 50)
                            .bold()
                            .font(.largeTitle)
                        
                        Button(action: {
                            withAnimation(.default){
                                selectOmniDex.toggle()
                            }
                        }, label: {
                            Image(systemName: "rectangle.2.swap")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30,height: 30)
                        })
                    }
                        
                }
                Spacer()
                
                ScrollView {
                    
                    ForEach(0..<7){index in
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: .infinity, height: 100)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                .shadow(radius: 10)
                            
                            HStack {
                                VStack {
                                    Circle()
                                        .frame(width: 40)
                                    .foregroundColor(.white)
                                    
                                    Text("XDC")
                                        .foregroundColor(.white)
                                }
                                    
                                
                                VStack {
                                    HStack {
                                        Image(systemName: "circle.grid.3x3.circle")
                                            .foregroundColor(.white)
                                        
                                        Spacer()
                                        
                                        Text("Test wallet \(index)")
                                            .foregroundColor(.white)
                                            .frame(width: .infinity, alignment: .center)
                                            .font(.title2)
                                            .bold()
                                        
                                        Spacer()
                                        
                                        Image(systemName: "paperplane.fill")
                                            .foregroundColor(.white)
                                    }
                                    
                                    HStack {
                                        Spacer()
                                        Text("xdc76f33784...e267a70f")
                                            .background(Color.gray)
                                            .cornerRadius(7)
                                            .foregroundColor(.white)
                                            .textSelection(.enabled)
                                        
                                        Image(systemName: "qrcode")
                                            .foregroundColor(.white)
                                    }
                                    
                                    Text("143,246")
                                        .foregroundColor(.white)
                                        .padding(.leading, 200)
                                        .bold()
                                    
                                    Text("$15,245")
                                        .foregroundColor(.white)
                                        .padding(.leading, 200)
                                }
                                //.background(Color.green)
                            }
                            .padding(.leading, 35)
                            .padding(.trailing, 35)
                            
                        }
                    }
                }
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.green)
                        .frame(width: .infinity, height: selectOmniDex ? 100:0)
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.bottom, selectOmniDex ? 60:0)
                    Circle()
                        .frame(width:selectOmniDex ?  50:0 , height: selectOmniDex ? 50:0, alignment: .trailing)
                        .padding(.bottom, selectOmniDex ? 60:0)
                        .padding(.trailing, selectOmniDex ? 250:0)
                    
                }
            }
        }
    }
    
    var DApps: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            Text("DApps")
        }
    }
    
    var ContactBook: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            Text("ContactBook")
        }
    }
    
    var Settings: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea(.all)
            Text("Settings")
        }
    }
    
}
        //.padding()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
