//
//  CoursesView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import Foundation

import SwiftUI



struct CoursesView: View {
    
    @StateObject private var model = CoursesViewModel()
   

    var body: some View {
        
        
      ScrollView{
        VStack{
           Spacer()
            Text("Cursos")
            Divider().padding(.horizontal , 40)
           
            }
            
            
            
            Spacer().frame( height: 30)
            
          Button("Add item"){
              model.addCourse()
          }
          
          Button("Add item"){
             
          }
            
          ForEach(model.courseList){ course in
              
              VStack{
                  
                  
                  CourseTileView(title: course.name, grade: course.grade, max_grade: course.max_grade, fontColor: .white, bgColor: kCadetBlue).padding(.horizontal, 10).padding(.horizontal, 10).onAppear(perform: {
                      withAnimation(.linear(duration: 0.05)) {
                       // code to execute
                      }
                      
                    
                  }).padding(.vertical, 10)
                  
              }
                     
          }
          
          //Divider
          HStack{
              VStack{
                  Divider().padding(.horizontal , 40)
                  
              }
             
              Image(systemName: "lock").font(.system(size: 40))
              VStack{
                  Divider().padding(.horizontal , 40)
                  
              }
          }
          
          ForEach(model.courseList){ course in
                
              CourseTileView(title: course.name, grade: course.grade, max_grade: course.max_grade, fontColor: .white, bgColor: kCadetBlue).padding(.horizontal, 10).padding(.horizontal, 10).onAppear(perform: {
                  withAnimation(.linear(duration: 0.05)) {
                   // code to execute
                  }
                
               })
                
                
          }
          
          
          
          
          
          
          CourseTileView(title: "Abecedario I", grade: 5, max_grade: 10, fontColor: .white, bgColor: kCadetBlue).padding(.horizontal, 10).padding(.horizontal, 10)
          
          Spacer()
            
            
            
            
           
            
            Spacer()
            
           
            
        
            
        }
            
            
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
            .previewDevice("iPhone 11")
    }
}

struct CourseTileView: View {
    
    var title: String
    var grade: Int
    var max_grade : Int
    var fontColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            
            HStack{
                
                Image("Curso1").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:150, height: 150, alignment: .topLeading)
                    .border(.blue)
                    .clipped().cornerRadius(20)
  
                VStack{
                    
                    Spacer().frame( height: 10)
                    HStack{
                        Spacer()
                        Text("\(grade) / \(max_grade)")
                            .font(.system(size: 20))
                            .foregroundColor(fontColor)
                            .padding(.horizontal, 10)
                        
                    }
                    
                    Text(title)
                        .font(.system(.title))
                        .foregroundColor(fontColor)
                        .fontWeight(.semibold)
                        .minimumScaleFactor(0.01)
                    
                    HStack{
                        
                        Button(action: {
                            print("Delete tapped!")
                        }) {
                            
                                Text("Aprende")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                  
                        }
                        .padding(10)
                        .foregroundColor(.white)
                        .background(kMidnightGreen)
                        .cornerRadius(50)
                        
                        Button(action: {
                            print("Delete tapped!")
                        }) {
                            
                                Text("Practica")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 15))
                                  
                        }
                        .padding(10)
                        .foregroundColor(.white)
                        .background(kMidnightGreen)
                        .cornerRadius(50)
                        
                    }
                    Spacer()

                }
                Spacer()
                
            }
            
            
        } //VStack
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(bgColor)
        .cornerRadius(20)
    }
    
    
    
}



