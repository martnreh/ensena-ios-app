//
//  TriviaView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 13/11/22.
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
                    await triviaManager.fetchTrivia(courseId: currentCourseId)
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
        }.onAppear{
            Task {
                await updateGrade()
            }
        }
        
    } else {
        QuestionView().environmentObject(triviaManager)
    }
    }
    
    
    
    
    func updateGrade() async {
            guard let url = URL(string: "http://127.0.0.1:5000/user/update/grade") else {
                print("No sirve el URL")
                return
            }
            
        let body: [String: String] = ["_id": idUserGlobal, "course": currentCourseTitle, "grade": "\(triviaManager.score)"]
            
            guard let finalBody = try? JSONEncoder().encode(body) else {
                return
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "PUT"
            request.httpBody = finalBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, res, err) in
                
                guard let data = data, err == nil else {return}
                
                let result = try? JSONDecoder().decode(ChangeGrade.self, from: data)
            
                
            
            }.resume()
        }
    
    
    
    
    
    
    }


struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager(courseId: "6364360774dfad2101e1f079"))
    }
}


struct ChangeGrade: Codable
{
    var _id: String
    var course: String
    var grade : String
}

