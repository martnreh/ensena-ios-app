//
//  MainQuizView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import SwiftUI

struct MainQuizView: View {
    
    @StateObject var triviaManager = TriviaManager()
    var body: some View {

        NavigationView {
            VStack(spacing: 40){
                    VStack(spacing: 20){
                        Text("Inicio de Quiz").font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("Teal"))
                        
                        Text("¿Listo para poner a prueba tus habilidades de Trivia?")
                            .foregroundColor(Color("Teal"))
                            .padding(.horizontal, 10)
                            .multilineTextAlignment(.center)
                            
                    }
                    
          
                NavigationLink {
                    TriviaView()
                        .environmentObject(triviaManager)
                } label: {
                    Text("Iniciar Quiz")
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Teal"))
                    .cornerRadius(30)
                    .shadow(radius: 10)
                }
                    
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                .background(Color("Fondo"))
        }
    }
    
}


struct MainQuizView_Previews: PreviewProvider {
    static var previews: some View {
        MainQuizView()
    }
}
