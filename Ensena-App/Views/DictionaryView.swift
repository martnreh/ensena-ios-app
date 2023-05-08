//
//  DictionaryView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI

struct Dic: Decodable
{
    var resultList: [Word]
    
    
    struct Word: Decodable, Identifiable {
        
        var id: UUID {
            UUID()
        }
        
        var courseId: String
        var courseName: String
        var image: String
        var name: String
    
    }
 

}

struct DiccionarioNuevo: Decodable {
    var resultado: [PalabraDic]
    
}

struct PalabraDic: Decodable, Identifiable {
    var id: UUID{
        UUID()
    }
    var courseName: String
    var image: String
    var name: String
}

func cargarDiccionario() -> [PalabraDic] {
    var dic: [PalabraDic] = []
    
    var cursos = cargaInfo()
    for curso in cursos {
        var cursoActual = curso.name
        var palabrasActuales = cargaPalabras(course: cursoActual)
        
        for palabra in palabrasActuales {
            
            var objetoPalabra: PalabraDic = PalabraDic(courseName: cursoActual, image: curso.image, name: palabra.word)
            
            dic.append(objetoPalabra)
            
        }
    }
    
    dic.sort{ $0.name < $1.name }

    return dic
}





struct DictionaryView: View {
    
    @State var searchText: String = ""
    @Binding var userId: String
    
    @State var filteredList: [PalabraDic] = []
    @State var allWords : [PalabraDic] = []


    var body: some View {
      
        VStack{

            NavigationView{
                
                ScrollView{
                
                ForEach(filteredList){ word in
                    
                   
                    
                    NavigationLink(destination: LearnView(courseName:word.courseName)){

                        WordView(palabra: word.name, image: word.image, courseName: word.courseName)


                        }.background(Color("MidnightGreen"))
                            .cornerRadius(10)
                        
                        
                    
                }.searchable(text: $searchText, prompt: "Ingresa tu palabra")
                }
                    
                    .navigationTitle("Diccionario")
                    .onChange(of: searchText){search in
                        filteredList = allWords.filter({$0.name.contains(search)})
                        if(search == ""){
                            filteredList = allWords
                            
                        }
                            
                            
                        
                        
                        
                    }
            }
 
            
            
            Spacer()
            
        }
        .onAppear{
            
            allWords = cargarDiccionario()
            filteredList = allWords

        }
        
        
        
    
    }
    
    
    
 
    
    
    
}
    




struct WordView: View {
    
    var palabra: String
    var image: String
    var courseName: String
    
    var body: some View {

        HStack{
            
            Image(image)
                .resizable()
                .frame(width: 128, height: 128)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
            VStack (alignment: .leading, spacing: 6){
                Text(palabra)
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(.white)
               
                
                Divider()
                    .frame(height: 2).background(Color.white)
                    
                
                HStack (spacing: 30){
                    Text(courseName)
                       
                    
                }.foregroundColor(.white)
                    .font(.system(size: 13, weight: .semibold))
                    

            
                
                    
            }.frame(height: 80)
        
        }.frame(width: 350, height: 120)
            //.background(Color("CadetBlue"))
            .cornerRadius(15)
        
    }
}



