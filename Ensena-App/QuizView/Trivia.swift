//
//  Trivia.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import Foundation

struct Trivia: Decodable {
    var questionList: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var correct: String
        var incorrectList: [[String]]
        var type: String
        var url: String
        
        var answers: [Answer] {
            do {
               let right = [Answer(text: try AttributedString(markdown: correct), isCorrect: true)]
               let incorrects = try incorrectList[0].map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
               let allAnswers = right + incorrects
                return allAnswers.shuffled()
                
                
                
            }
            catch {
                print("Error setting answers: \(error)")
                return []
            }
        }

    }
}
