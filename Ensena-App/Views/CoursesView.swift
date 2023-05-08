//
//  CoursesView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI

struct CoursesView: View {
        
   // @StateObject var courseModel: CoursesViewModel = CoursesViewModel()
   // @Binding var userId: String
    @State var listaCursos: [Curso] = []

    var body: some View {

        NavigationView{
        VStack{

            ScrollView{
                ForEach(listaCursos){ c in
                        
                    CourseView(image: c.image, courseName: c.name, courseId: c.id, review: c.review)
                
                }
            }
            .onAppear{
                listaCursos = cargaInfo()
            }

            Spacer()
            
            
       
        }.navigationBarTitle("Mis Cursos")
        
    
    
    }
    }
                   
  
}


struct CourseView: View {
    
    var image: String
    var courseName: String
    var courseId: String
    var review: Bool
    
    
    var body: some View {
        
        HStack{
            
            Image(image)
                .resizable()
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 20))
 
            
            VStack (spacing: 8){
                
                Text(courseName)
                    .font(.system(.title))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                
                HStack{
                    Spacer()
                    
                    if(!review){
                        NavigationLink(destination: LearnView(courseName: courseName)) {

                                  Text("Aprende")
                                      .fontWeight(.semibold)
                                      .font(.system(size: 15))
                                      .padding(8)
                                      .foregroundColor(.white)
                                      .background(Color("MiddleBlue"))
                                      .cornerRadius(50)
                                      
                        }
                        
                    }
                    
                   VStack {

                              Text("Practica")
                                  .fontWeight(.semibold)
                                  .font(.system(size: 15))
                                  .padding(8)
                                  .foregroundColor(.white)
                                  .background(Color(!review ? "MidnightGreen" : "CadetBlue"))
                                  .cornerRadius(50)
                                  
                    }
                    
                    Spacer()
      
                }
                
            }
            
            
            
            Spacer()
            
        }.frame(width: 350, height: 120)
            .background(Color(!review ? "CadetBlue" : "MidnightGreen"))
            .cornerRadius(15)
        
    }
}




    class Curso: Codable, Identifiable {
    
        var id: String
        var image: String
        var name: String
        var review : Bool
        
        init(id: String, image: String, name: String, review: Bool) {
            self.id = id
            self.image = image
            self.name = name
            self.review = review
        }
        
    }


func cargaInfo() -> [Curso] {
    var ruta: String?
    
    ruta = Bundle.main.path(forResource: "Cursos", ofType: "plist")
    
    var listaCursos = [Curso]()
    
    do {
        var miurl = URL(fileURLWithPath: ruta ?? "")
        print(miurl)
        let data = try Data.init(contentsOf: miurl)
        
        listaCursos = try PropertyListDecoder().decode([Curso].self, from: data)
    }
    catch {
        print("Error al cargar archivo")
    }
    
    return listaCursos
}
