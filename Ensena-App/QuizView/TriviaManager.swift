//
//  TriviaManager.swift
//  Ensena-App
//
//  Created by Adrian Faz on 09/11/22.
//

import Foundation

class TriviaManager: ObservableObject {
    private(set) var trivia: [Trivia.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var url: String = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: Float = 0.00
    @Published private(set) var score = 0

    init() {
        Task.init {
            await fetchTrivia()
        }
    }
    
    func fetchTrivia() async {
        guard let url = URL(string: "http://127.0.0.1:5000/course/6364360774dfad2101e1f079/practice") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Trivia.self, from: data)
            
            DispatchQueue.main.async{
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.trivia = decodedData.questionList
                self.length = self.trivia.count
                self.setQuestion()
                
            }
            
            
        } catch {
            print("Error fetching trivia: \(error)")
        }
    }
    func goToNextQuestion() {
        if index + 1 < length{
            index += 1
            setQuestion()
        } else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress =  Float(Double(index + 1) / Double(length)) * 350
        
        if index < length {
            let currentTriviaQuestion = trivia[index]
            url = currentTriviaQuestion.url
            answerChoices = currentTriviaQuestion.answers
        }
        
    }
    
    func selectAnswer(answer: Answer){
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
        
    }
}
