//
//  Register.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 27/11/22.
//

import Foundation



struct Register: Identifiable, Codable{
    
    var id = UUID()
    var name: String
    var lastname: String
    var position: String
    var email: String
    var username: String
    var password: String
    var image: String
    
    
    
    
    
    init(name: String, lastName: String, position: String , email : String , username : String , password : String , image: String ){
        self.name = name
        self.lastname = lastName
        self.position = position
        self.email = email
        self.username = username
        self.password = password
        self.image = image
    }
    
    
}

