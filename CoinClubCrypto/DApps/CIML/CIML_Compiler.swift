//
//  CIML_Compiler.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 11/5/22.
//

import SwiftUI
import Foundation


struct CIML_View: View{
    
    @State var background: Color = .red
    let mainView:[AnyView] = []
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 700)
                .frame(maxWidth: .infinity)
                .foregroundColor(background)
            VStack {
            }
        }
        .frame(height: 700)
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct CIML_Objects: View {
    @State var All_CIML_TOKENS:[CIML_Lexer] = []
    
    let data = Array(1...119).map { "\($0)" }
    let layout = [
        GridItem(.adaptive(minimum: 50))
    ]
    
    let text = CIMLText(
        text: "ciml text",
        location: [0,0,0])
    
    let textField = CIMLTextField(text: "Enter in info")
    
    let sysImage = CIMLSYSImage(name: "gear")
    
    //var button = CIMLButton(label: <#T##AnyView#>, type: "toggle")
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 700)
                .frame(maxWidth: .infinity)
                .foregroundColor(.red)
            VStack {
                LazyVGrid(columns: layout, spacing: 20){
                    ForEach(data, id: \.self){item in
                        VStack {
                            Button(action: {}, label: {
                                Rectangle()
                                    .frame(width: 20,height: 20)
                            })
                        }
                    }
                }
            }
        }
        .frame(height: 750)
        .frame(maxWidth: .infinity)
        .padding(10)
        }
    }

struct TEXT: View {
    private var text:String
    private var foreGroundColor:Color
    private var font:Font
    private var frame:[CGFloat]
    private var alignment:Alignment
    private var backgroundColor:Color
    private var cornerRadius:CGFloat
    private var bold:Bool
    private var fontWeight:Font.Weight
    private var shadow:CGFloat
    private var padding:CGFloat = 20
    
    
    var body: some View {
        Text(text)
            .foregroundColor(foreGroundColor)
            .font(font)
            .frame(width: frame[0], height: frame[1], alignment: alignment)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .bold(bold)
            .fontWeight(fontWeight)
            .shadow(radius: shadow)
            .padding(padding)
    }
}
struct TEXT_FIELD:View{
    private var text:String
    @State var textField:String = ""
    private var foreGroundColor:Color
    private var frame:[CGFloat]
    private var alignment:Edge.Set
    private var backgroundColor:Color
    private var cornerRadius:CGFloat
    private var shadow:CGFloat
    private var padding:CGFloat = 20
 
    var body: some View {
        TextField(text, text: $textField)
            .frame(maxWidth: frame[0])
            .frame(height: frame[1])
            .foregroundColor(foreGroundColor)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .padding(alignment,padding)
            .shadow(radius: shadow)
        
    }
}
struct SYSIMAGE:View{
    private var sysname:String
    private var frame:[CGFloat]
    private var padding:CGFloat = 20
    
    var body: some View {
        ZStack {
            Image(systemName: sysname)
                .resizable()
                .scaledToFit()
        }
        .frame(width: frame[0])
        .padding(padding)
    }
}

struct BUTTON:View{
    
    private var label:AnyView
    private var type:String
    var body: some View {
        Button(action: {
            //Types:
            //Toggle Button
            //Submit Function
            //Segue
        }, label: {
            label
        })
    }
}


struct CIML_Compiler: View {
    var body: some View {
        CIML_Objects()
    }
}

struct CIML_Compiler_Previews: PreviewProvider {
    static var previews: some View {
        CIML_Compiler()
    }
}
