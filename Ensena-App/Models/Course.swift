//
//  Course.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import Foundation



struct Course: Identifiable, Codable{
    
    var id = UUID()
    var name: String
    var description: String
    var grade: Int
    var max_grade : Int
    var review : Bool

}

