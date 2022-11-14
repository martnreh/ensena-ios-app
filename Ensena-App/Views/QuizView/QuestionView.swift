//
//  QuestionView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 13/11/22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    var body: some View {
        
        VStack{
        
            if !triviaManager.answerChoices.isEmpty{
            VStack{
                
                VStack{
                    
                    
                }
                
               
                    HStack{
                        
                        Text(currentCourseTitle)
                         
                            .frame(maxWidth: .infinity)
                            .padding(.init(top: 60, leading: 0, bottom: 20, trailing: 0))
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
                    
                Image("sign")
                    
                    .padding()
                    .background(Color("Teal"))
                    .cornerRadius(20)
                
              
                VStack (alignment: .leading, spacing: 20){
                    ForEach(triviaManager.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer).environmentObject(triviaManager)
                    }
                }.padding(.horizontal)
                
                
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
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarHidden(true)
            }
            else{
                LoadingView(strong: false)
            }
        }
        
        
    }
        
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TriviaManager(courseId: "6364360774dfad2101e1f079"))
    }
}
