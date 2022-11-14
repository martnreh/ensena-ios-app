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
    
    @State var searchingFor: String = "Cabeza"
    
    @State var filteredList: [Dic.Word] = []
    @State var wordList: [Dic.Word] = []

    var body: some View {
      
        VStack{
            
            Spacer()
        Text("Diccionario").font(.system(size: 25, weight: .light))
             Divider().padding(.horizontal , 40)
        
        Spacer()
        
           
            
            NavigationView{
                List{
                    ForEach(filteredList, id: \.id){ palabra in
                        NavigationLink(destination: Text(palabra.name)){
                            
                            HStack{
                                
                                Image("girl").resizable()
                                    .scaledToFit()
                                    .frame(width: 110)
                                    .cornerRadius(7)
                                VStack (alignment: .leading, spacing: 6){
                                    Text(palabra.name)
                                        .font(.system(size: 20, weight: .heavy))
                                        .foregroundColor(.white)
                                   
                                    
                                    Divider()
                                        .frame(height: 2).background(Color.white)
                                        
                                    
                                    HStack (spacing: 30){
                                        Text(palabra.courseName)
                                           
                                        Text("Aprende")
                                            .padding(3)
                                            .background(.green)
                                            .cornerRadius(10)
                                        
                                    }.foregroundColor(.white)
                                        .font(.system(size: 13, weight: .semibold))
                                        

                                
                                    
                                        
                                }.frame(height: 80)
                            
                            }
                    
                            
                        }.background(.teal)
                            .cornerRadius(10)
                        
                        
                    }
                }.searchable(text: $searchingFor, prompt: "Ingresa tu palabra")
                    .navigationTitle("Palabras LSM")
                            }
 

            
            Spacer()
            
        }.onAppear{
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
                        wordList = decodedData.resultList
                        filteredList = wordList
                    }
                }catch{
                            print("Error!")
                    }
                }
            }
        }.resume()
    }
    
    var results: [Dic.Word]{
        if searchingFor.isEmpty{
            return wordList
        } else {
            return wordList.filter{($0.name).contains(searchingFor)}
        }
    }
    
}

struct DictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        DictionaryView()
    }
}
