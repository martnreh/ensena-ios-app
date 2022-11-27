//
//  User.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 08/11/22.
//

import Foundation


struct User: Decodable
{
    var position: String
    var fullName: String
    var courseProgress: Int
    var completedCourses = [ImageCourse]()
    var image : String
    
    struct ImageCourse: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var image: String
        var title: String
    }

    
    init(){
        self.position = ""
        self.fullName = ""
        self.courseProgress = 0
        self.completedCourses = [ImageCourse(image: "", title: "")]
        self.image = ""
    }
    
    init(position: String, fullName: String, courseProgress: Int, completedCourses: [ImageCourse], image: String ){
        self.position = position
        self.fullName = fullName
        self.courseProgress = courseProgress
        self.completedCourses = completedCourses
        self.image = image
    }

}
