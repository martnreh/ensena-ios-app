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




struct DictionaryView: View {
    
    @State var searchText: String = ""
    @Binding var userId: String
    
    @State var filteredList: [Dic.Word] = []
    @State var allWords : [Dic.Word] = []


    var body: some View {
      
        VStack{
            
         
        
        
            
            NavigationView{
                
                List(filteredList){ word in
                    
                   
                    
                    NavigationLink(destination: LearnView(courseId: word.courseId, courseName:word.courseName)){

                        WordView(palabra: word.name, image: word.image, grade: 10, max_grade: 10, courseName: word.courseName, courseId: word.courseId, userId: $userId)


                        }.background(Color("CadetBlue"))
                            .cornerRadius(10)
                        
                        
                    
                }.searchable(text: $searchText, prompt: "Ingresa tu palabra")
                    
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
            Task {
                await fetchDictionary()
            }
        }
        
        
        
    
    }
    
    
    
    func fetchDictionary() async {
        
        let urlString = "http://127.0.0.1:5000/dictionary"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async{
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Dic.self, from: data)

                    
                    DispatchQueue.main.async{
                        self.allWords = decodedData.resultList
                        self.filteredList = allWords
                        
                    }
                }catch{
                            print("Error!")
                    }
                }
            }
        }.resume()
    }
    
    
    
}
    


struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView(userId: .constant(""))
    }
}


struct WordView: View {
    
    var palabra: String
    var image: String
    var grade: Int
    var max_grade : Int
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
            .clipShape(RoundedRectangle(cornerRadius: 7))
            
            
            VStack (alignment: .leading, spacing: 6){
                Text(palabra)
                    .font(.system(size: 20, weight: .heavy))
                    .foregroundColor(.white)
               
                
                Divider()
                    .frame(height: 2).background(Color.white)
                    
                
                HStack (spacing: 30){
                    Text(courseName)
                       
//                    NavigationLink (destination: LearnView(courseId: "6364360774dfad2101e1f079")) {
//
//                              Text("Aprende")
//                                  .fontWeight(.semibold)
//                                  .font(.system(size: 15))
//                                  .padding(8)
//                                  .foregroundColor(.white)
//                                  .background(Color("MiddleBlue"))
//                                  .cornerRadius(50)
//
//                    }.navigationBarBackButtonHidden(true)
//                    .simultaneousGesture(TapGesture().onEnded{
//                       currentCourseId = courseId
//                        currentCourseTitle = courseName
//                    })
                    
                }.foregroundColor(.white)
                    .font(.system(size: 13, weight: .semibold))
                    

            
                
                    
            }.frame(height: 80)
        
        }.frame(width: 350, height: 120)
            //.background(Color("CadetBlue"))
            .cornerRadius(15)
        
    }
}



