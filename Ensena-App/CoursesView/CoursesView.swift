//
//  CourseViewFaz.swift
//  Ensena-App
//
//  Created by Adrian Faz on 12/11/22.
//

import SwiftUI

struct CoursesView: View {
        
    @StateObject var courseModel: CoursesViewModel = CoursesViewModel()

    var body: some View {

        NavigationView{
        VStack{

            ScrollView{
            ForEach(courseModel.allCourses){ course in
                    
                CourseView(image: "fotoAbecedario", grade: course.grade, max_grade: course.maxGrade, courseName: course.name, courseId: course.id)
                
            }
            }

            Spacer()
            
            
       
        }.navigationBarTitle("Mis Cursos")
        .onAppear {
            Task {
                await courseModel.fetchCourseInfo(idUserFetch: "6364357674dfad2101e1f078")
        }}
            
    
    }
    }
                   
  
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
        
    }
}





struct CourseView: View {
    
    var image: String
    var grade: String
    var max_grade : String
    var courseName: String
    var courseId: String
    
    var body: some View {

        HStack{
            Image(image).resizable()
                .frame(width: 105, height: 105)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding(.leading, 4)
            
            Divider()
            
            VStack (spacing: 8){
                HStack{
                    Spacer()
                    Text(grade + "/" + max_grade)
                        .foregroundColor(.white)
                    
                }
                Text(courseName)
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                
                HStack{
                    Button(action: {
                        print("Hola")
                    }) {
                        
                        Text("Aprende")
                            .fontWeight(.semibold)
                            .font(.system(size: 15))
                        
                    }
                    .padding(8)
                    .foregroundColor(.white)
                    .background(kMidnightGreen)
                    .cornerRadius(50)
                    
                    
                    NavigationLink (destination: MainQuizView(cursoId: courseId)) {

                              Text("Practica")
                                  .fontWeight(.semibold)
                                  .font(.system(size: 15))
                                  .padding(8)
                                  .foregroundColor(.white)
                                  .background(kMidnightGreen)
                                  .cornerRadius(50)
                                  
                    }.navigationBarBackButtonHidden(true)
                    .simultaneousGesture(TapGesture().onEnded{
                        cursoActual = courseId
                        tituloCursoActual = courseName
                    })
                    

                    
                }
                
            }
            
            
            
            Spacer()
            
        }.frame(width: 350, height: 120)
            .background(kCadetBlue)
            .cornerRadius(15)
        
    }
}
