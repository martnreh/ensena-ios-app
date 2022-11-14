//
//  MainQuizView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import SwiftUI

struct MainQuizView: View {
    var cursoId: String
    @StateObject var triviaManager = TriviaManager(courseId: cursoActual)
    var body: some View {

        NavigationView {
            
            VStack(spacing: 40){
                    VStack(spacing: 20){
                        Text("Quiz: \(tituloCursoActual)" ).font(.title)
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
                .background(Color("LightBlue"))
        }
    }
    
}


struct MainQuizView_Previews: PreviewProvider {
    static var previews: some View {
        MainQuizView(cursoId: "6364360774dfad2101e1f079")
    }
}
