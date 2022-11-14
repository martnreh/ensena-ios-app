//
//  Answer.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 13/11/22.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
