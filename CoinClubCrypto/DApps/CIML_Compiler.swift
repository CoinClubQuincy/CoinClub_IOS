//
//  CIML_Compiler.swift
//  CoinClubCrypto
//
//  Created by Quincy Jones on 11/5/22.
//

import SwiftUI
import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct Welcome: Codable {
    let cimlVersion, contractLanguage, name, symbol: String
    let imgURL, contractOrigin: String
    let functions, variables, objects, metadata: [String]

    enum CodingKeys: String, CodingKey {
        case cimlVersion = "CIML_Version"
        case contractLanguage = "Contract_Language"
        case name = "Name"
        case symbol = "Symbol"
        case imgURL = "img_url"
        case contractOrigin = "ContractOrigin"
        case functions = "Functions"
        case variables = "Variables"
        case objects = "Objects"
        case metadata
    }
}


struct CIML_Compiler: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CIML_Compiler_Previews: PreviewProvider {
    static var previews: some View {
        CIML_Compiler()
    }
}
