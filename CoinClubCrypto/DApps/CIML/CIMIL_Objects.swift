//
//  CIMIL_Objects.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 11/11/22.
//

import SwiftUI
import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.To parse the JSON, add this file to your project and do:   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
// MARK: - Welcome
struct Welcome: Codable {
    let cimlVersion, contractLanguage, name, symbol: String
    let logo, thumbnail, contractOrigin: String
    let variables, functions, objects, views: [String]
    let metadata: [String]

    enum CodingKeys: String, CodingKey {
        case cimlVersion = "CIML_Version"
        case contractLanguage = "Contract_Language"
        case name = "Name"
        case symbol = "Symbol"
        case logo
        case thumbnail = "Thumbnail"
        case contractOrigin = "ContractOrigin"
        case variables = "Variables"
        case functions = "Functions"
        case objects = "Objects"
        case views = "Views"
        case metadata = "Metadata"
    }
}

struct Variable_Model:Identifiable {
    let id: String = UUID().uuidString
    let varName:String
    let type:String
    var value:String
}
struct Function_Model:Identifiable {
    let id: String = UUID().uuidString
    let varName:String
    let type:String
    var value:[String]
}
struct Objects: Identifiable {
    let id: String = UUID().uuidString
    let type:String
    var text: String
    var textFeild: String
    var foreGroundColor: Color
    var font: Font
    var frame: [CGFloat]
    var frameBackGroundColor: Color
    var tokenBackGroundColor: Color
    var cornerRadius: CGFloat
    var bold: Bool
    var fontWeight: Font.Weight
    var shadow: CGFloat
}

struct CIML_Lexer: Identifiable {
    let id: String = UUID().uuidString
    var Object: AnyView
}

class CIML_Parser: ObservableObject {
    @Published var variable_Tokens:[Variable_Model] = []
    @Published var function_Tokens:[Function_Model] = []
    @Published var object_Tokens:[Objects] = []
    
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
    
    init(CIML_OBJECT: String){}
    
    func Parser(token_object:String){}
    func Text(){}
    func TextField(){}
    func Image(type:String,url:String){}
    func Button(actions:String,label:String){}
    func View_Object_Viewer(){}
}

struct CIML_Text: View {
    @State var vm = CIML_Parser(CIML_OBJECT: "Text").objects
    var body: some View {
     Text("text")
    }
}


