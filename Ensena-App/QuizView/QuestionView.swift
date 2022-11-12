//
//  QuestionView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        
        
        VStack(spacing: 15){
            
            HStack{
                Text("Partes del Cuerpo")
                    .frame(width: 420)
                    .padding(10)
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
            }.background(Color("CadetBlue"))
            Text("\(triviaManager.index + 1 )/\(triviaManager.length)")
            .padding(.horizontal, 40)
            .padding(.vertical, 6)
            .background(Color("Teal"))
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white)
            .cornerRadius(20)
            .padding(.bottom, 8)
            
        
            ProgressBar(progress: CGFloat(triviaManager.progress))
                .padding(.bottom, 10)
                
            Image("Words")
                
                .padding()
                .background(Color("Teal"))
                .cornerRadius(20)
            
            VStack (alignment: .leading, spacing: 20){
                ForEach(triviaManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer).environmentObject(triviaManager)
                }
            }
            
            Button {
                triviaManager.goToNextQuestion()
            } label: {
                Text("Siguiente")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(triviaManager.answerSelected ? Color("Teal") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(30)
                .shadow(radius: 10)
                .padding(.top, 15)
            }
            .disabled(!triviaManager.answerSelected)
        
            
            
        Spacer()
        }.padding(.horizontal)
        .navigationBarHidden(true)
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager())
    }
}
