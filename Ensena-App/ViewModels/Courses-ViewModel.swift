//
//  Courses-ViewModel.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI

extension CoursesView {
    @MainActor class CoursesViewModel: ObservableObject{
        @Published var allCourses: [courseList.myCourse] = []
        @Published var cursoActual: String = ""

        
        
        func fetchCourseInfo(idUserFetch: String) async {
            print("aaaaaaaaaaaaa")
            print(idUserFetch)
            
            guard let url = URL(string: ("http://127.0.0.1:5000/course/all/" + idUserFetch)) else {fatalError("Missing URL")}
            
            let urlRequest = URLRequest(url: url)
            
           
            
            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error while fetching data")}
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(courseList.self, from: data)
                
                DispatchQueue.main.async{
                   
                    self.allCourses = decodedData.courses
                    
                }
                
                
            } catch {
                print("Error fetching trivia: \(error)")
            }
        }

    }
}

struct courseList: Decodable {
    var courses: [myCourse]
    
    struct myCourse: Decodable, Identifiable {
        
        var grade: String
        var id: String
        var image: String
        var maxGrade: String
        var name: String
        
    }
}
