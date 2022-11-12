//
//  Answer.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
