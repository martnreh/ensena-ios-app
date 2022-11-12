//
//  TriviaView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager

    var body: some View {
        if triviaManager.reachedEnd{
        VStack(spacing: 20){
            Text("Examen de Palabras")
                .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Teal"))
            
            Text("Felicidades, ¡terminaste la prueba!")
                .foregroundColor(Color("Teal"))
            
            Text("Obtuviste \(triviaManager.score) de \(triviaManager.length)")
            
            Button {
                Task.init{
                    await triviaManager.fetchTrivia()
                }
            } label: {
                    Text("Jugar de Nuevo")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Teal"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    
                }
            }
        
    } else {
        QuestionView().environmentObject(triviaManager)
    }
    }
    }


struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
