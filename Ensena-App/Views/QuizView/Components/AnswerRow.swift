//
//  AnswerRow.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 13/11/22.
//

import Foundation
import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var triviaManager: TriviaManager

    var answer: Answer
    
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "hand.draw.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }.padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(triviaManager.answerSelected ? (isSelected ? Color("Teal"): .gray) : Color("Teal"))
            .background(.white)
            .cornerRadius(10)
            .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x:0.5, y:0.5)
            .onTapGesture {
                if !triviaManager.answerSelected {
                    isSelected = true
                    triviaManager.selectAnswer(answer: answer)
                }
                
            }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        
        AnswerRow(answer: Answer(text: "Single", isCorrect: false))
            .environmentObject(TriviaManager(courseId: "6364360774dfad2101e1f079"))

    }
}
