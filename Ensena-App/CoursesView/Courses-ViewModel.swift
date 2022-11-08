//
//  Courses-ViewModel.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import Foundation
import SwiftUI


extension CoursesView{
    
    @MainActor class CoursesViewModel:ObservableObject{
        
     
       
        @Published var courseList = [Course]()
        @Published var courseLista = [String]()
            
        
        
       
        
        func addCourse(){
  
            let newCourse = Course(name: "Curso de aprendizaje I", description: "Curso \(courseList.count + 1)", grade: 6 , max_grade: 10)
            
  
            withAnimation{
                courseList.insert(newCourse, at: 0)
     
                
            }
            
            
        }
    }
}

