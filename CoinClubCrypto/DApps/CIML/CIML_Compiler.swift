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
    @State var vm = CIML_Parser(CIML_OBJECT: "Text").objects
    //var mainView:[Any] = []
    
    let objects = Objects(
        type: "Text",
        text: "ciml text",
        textFeild: "enter here",
        foreGroundColor: .black,
        font: .headline,
        frame: [100,50],
        frameBackGroundColor: .red,
        tokenBackGroundColor: .white,
        cornerRadius: 10,
        bold: false,
        fontWeight: .regular,
        shadow: 10)
    
    //var test: View = []
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 700)
                .frame(maxWidth: .infinity)
                .foregroundColor(vm.frameBackGroundColor)
            VStack {
//                ForEach(mainView){ index in
//                    index.Object
//                }
                
            }
        }
        .frame(height: 700)
        .frame(maxWidth: .infinity)
        .padding()
    }
    var TEXT: some View {
        Text(vm.text)
            .foregroundColor(vm.foreGroundColor)
            .font(vm.font)
            .frame(width: vm.frame[0], height: vm.frame[1], alignment: .center)
            .background(vm.tokenBackGroundColor)
            .cornerRadius(vm.cornerRadius)
            .bold(vm.bold)
            .fontWeight(vm.fontWeight)
            .padding()
            .shadow(radius: vm.shadow)
    }
    var TEXT_FIELD: some View {
        TextField(vm.text, text: $vm.textFeild)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .foregroundColor(vm.foreGroundColor)
            .background(vm.tokenBackGroundColor)
            .cornerRadius(vm.cornerRadius)
            .padding(.horizontal)
            .shadow(radius: vm.shadow)
            
    }
    var IMAGE: some View {
        ZStack {
            Image(systemName: "lock.doc")
                .resizable()
                .scaledToFit()
        }
        .frame(width: vm.frame[0])
        .padding()
    }
    
    var BUTTON: some View {
        Button(action: {
            //bold.toggle()
        }, label: {
            TEXT
        })
    }
    var STACK: some View {
        //Array of views in stack
        Text("stack")
    }
    var SPACER: some View {
        Spacer()
    }
    var HSTACK: some View {
        HStack(alignment: .center, spacing: 0){
            
        }
    }
    var VSTACK: some View {
        VStack(alignment: .center, spacing: 0){
            
        }
    }
    var ZSTACK: some View {
        ZStack(alignment: .center){
            
        }
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
