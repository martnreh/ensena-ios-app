//
//  CoursesView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI



struct CoursesView: View {
        
    @StateObject var courseModel: CoursesViewModel = CoursesViewModel()
    @Binding var userId: String

    var body: some View {

        NavigationView{
        VStack{

            ScrollView{
                ForEach(courseModel.allCourses){ course in
                        
                    CourseView(image: course.image, grade: course.grade, max_grade: course.maxGrade, courseName: course.name, courseId: course.id, userId: $userId)
                
                }
            }

            Spacer()
            
            
       
        }.navigationBarTitle("Mis Cursos")
        .onAppear {
            Task {
                await courseModel.fetchCourseInfo(idUserFetch: userId)
        }}
            
        .onChange(of: userId, perform: { _ in
            
            print("Value Changed! REEEEEEEEEEEEEEEEEEEEEEEEEEEEE")
            Task {
                await courseModel.fetchCourseInfo(idUserFetch: userId)
        }
            
        })
            
        
            
    
    }
    }
                   
  
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView(userId: .constant(""))
        
    }
}





struct CourseView: View {
    
    var image: String
    var grade: String
    var max_grade : String
    var courseName: String
    var courseId: String
    @Binding var userId: String
    
    
    var body: some View {
        
        HStack{
            
            AsyncImage(url: URL(string: image)) { imagen in
                imagen.resizable()
            }  placeholder: {
                Color("CadetBlue")
            }
            .frame(width: 128, height: 128)
            .clipShape(RoundedRectangle(cornerRadius: 20))
 
            
            VStack (spacing: 8){
                HStack{
                    Spacer()
                    Text( "\(grade) / \(max_grade)")
                        .foregroundColor(.white)
                    
                }
                Text(courseName)
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                
                HStack{
                    NavigationLink (destination: LearnView(userId: $userId)) {

                              Text("Aprende")
                                  .fontWeight(.semibold)
                                  .font(.system(size: 15))
                                  .padding(8)
                                  .foregroundColor(.white)
                                  .background(Color("MiddleBlue"))
                                  .cornerRadius(50)
                                  
                    }.navigationBarBackButtonHidden(true)
                    .simultaneousGesture(TapGesture().onEnded{
                       currentCourseId = courseId
                        currentCourseTitle = courseName
                    })
                    
                    
                    NavigationLink (destination: MainQuizView(cursoId: courseId)) {
                        
                        

                              Text("Practica")
                                  .fontWeight(.semibold)
                                  .font(.system(size: 15))
                                  .padding(8)
                                  .foregroundColor(.white)
                                  .background(Color("MidnightGreen"))
                                  .cornerRadius(50)
                                  
                    }.navigationBarBackButtonHidden(true)
                    .simultaneousGesture(TapGesture().onEnded{
                        currentCourseId = courseId
                        currentCourseTitle = courseName
                    })
                    

                    
                }
                
            }
            
            
            
            Spacer()
            
        }.frame(width: 350, height: 120)
            .background(Color("CadetBlue"))
            .cornerRadius(15)
        
    }
}