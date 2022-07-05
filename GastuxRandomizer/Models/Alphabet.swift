//
//  Alphabet.swift
//  GastuxRandomizer
//
//  Created by Gastón on 02/07/2022.
//

import Foundation

protocol Alphabet {
    var id: String { get }
    var values: [String] { get }
}

class Alphabets {
    
    static let options: [any Alphabet] = [
        FixedSetAlphabet(id: "letters", values: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]),
        FixedSetAlphabet(id: "vowels", values: ["A","E","I","O","U"]),
        FixedSetAlphabet(id: "numbers", values: ["0","1","2","3","4","5","6","7","8","9"])
    ]
    
    static func getById(_ id: String) -> any Alphabet {
        return options.first(where: { $0.id == id })!
    }
}

struct FixedSetAlphabet: Alphabet {

    let id: String
    let values: [String]

    init(id: String, values: [String]) {
        self.id = id
        self.values = values
    }
}
