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
    let funcName:String
    let type:String
    var inputValue:[String]
    var outputValue:[String]
}
struct CIMLText: Identifiable {
    let id: String = UUID().uuidString
    var text:String
    var foreGroundColor:Color = .black
    var font:Font = .headline
    var frame:[CGFloat] = [100,50]
    var alignment:Alignment = .center
    var backgroundColor:Color = .clear
    var cornerRadius:CGFloat = 0.0
    var bold:Bool = false
    var fontWeight:Font.Weight = .regular
    var shadow:CGFloat = 0.0
    var padding:CGFloat = 20
    var location:Int
}
struct CIMLTextField: Identifiable {
    let id: String = UUID().uuidString
    var text:String
    var textField:String = ""
    var foreGroundColor:Color = .gray
    var frame:[CGFloat] = [300,60]
    var alignment:Edge.Set = .horizontal
    var backgroundColor:Color = .white
    var cornerRadius:CGFloat = 10
    var shadow:CGFloat = 10
    var padding:CGFloat = 20
    var location:Int
}
struct CIMLSYSImage: Identifiable {
    let id: String = UUID().uuidString
    var name:String
    var frame:[CGFloat] = [50]
    var padding:CGFloat = 20
    var location:Int
  
}
struct CIMLButton: Identifiable {
    let id: String = UUID().uuidString
    var label:AnyView
    var type:String
}


struct CIML_Lexer: Identifiable {
    let id: String = UUID().uuidString
    var Object: AnyView
}

class CIML_Parser: ObservableObject {
    @Published var variable_Tokens:[Variable_Model] = []
    @Published var function_Tokens:[Function_Model] = []
    @Published var Text_Tokens:[CIMLText] = []
    @Published var TextField_Tokens:[CIMLTextField] = []
    @Published var SysImage_Tokens:[CIMLSYSImage] = []
    @Published var Button_Tokens:[CIMLButton] = []
    
    init(CIML_OBJECT: String){}
    
    func Parser(token_object:String){}
    func Text(){}
    func TextField(){}
    func Image(type:String,url:String){}
    func Button(actions:String,label:String){}
    func View_Object_Viewer(){}
}



