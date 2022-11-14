//
//  Word.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 11/11/22.
//

import Foundation


import SwiftUI


struct Word: Decodable,Identifiable{
    
    var id = UUID()
    var word: String
    var image: String
    
    init(){
        self.word = ""
        self.image = ""
    }
    
    init(word: String, image: String){
        self.word = word
        self.image = image
    }
    
}
