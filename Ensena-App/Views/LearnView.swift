//
//  LearnView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 11/11/22.
//

import SwiftUI
import AVKit


struct Learn: Decodable
{
    var wordList: [Wordd]
    
    
    struct Wordd: Decodable,Identifiable{
        
        var id: UUID {
            UUID()
        }
        var url: String
        var word: String
        var type: String

        
    }
 

}


struct LearnView: View {
    
    var courseName: String
    @State var listaPalabras : [Palabra] = []
    
    
    var body: some View {
        
        
        VStack(spacing: -105){
            // HEADER
            
            HStack{
                
                Text(courseName)
                
                    .frame(maxWidth: .infinity)
                    .padding(.init(top: 60, leading: 0, bottom: 20, trailing: 0))
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .semibold))
                
            }.background(Color("CadetBlue")).edgesIgnoringSafeArea(.all)
            
            
            ScrollView{
                
                ForEach(listaPalabras) { element in
                    CourseElement(word: element.word, fileName:  element.fileName, type: element.type)
                    
                }
                
            }
            
            
            
        }
        //.edgesIgnoringSafeArea(.all)
        .onAppear{
            
            listaPalabras = cargaPalabras(course: courseName)
            
        }
    }
    
    
    
    
    
    // Each course
    struct CourseElement: View {
        
        var word: String
        var fileName: String
        var type: String
        @State private var player : AVPlayer?
        
        var body: some View {
            
            VStack() {
                
                Text(word)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color("MidnightGreen"))
                    .padding(.top, 10)
                
                if (type == "img") {
                    
                    Image(fileName)
                        .resizable()
                        .frame(width: 310, height: 250)
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                    
                    
                } else if (type == "vid"){
                    
                    
                    
                    let player = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: "m4v")!)
                    
                    VideoPlayer(player: player)
                        .frame(height: 263)
                        .onAppear() {
                            addObserver(player: player)
                        }
                        .onDisappear{
                            
                            removeObserver(player: player)
                        }
                    
                    
                    
                }
                
                Divider().frame(width: 350,height: 35).background(Color("CadetBlue")).padding(.top,0)
                
            } //VStack
            .frame(width: 350, height: 350)
            .background(.white)
            .cornerRadius(20)
            .padding(.all, 20)
            .padding(.bottom, 0)
            
            .shadow(color: Color.gray.opacity(0.7),
                    radius: 8,
                    x: 0,
                    y: 0)

            
            
        }
        
        
        func addObserver(player : AVPlayer) {
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                                   object: player.currentItem, queue: nil) { notif in
                player.seek(to: .zero)
                player.play()
            }
        }
        
        func removeObserver(player : AVPlayer) {
            NotificationCenter.default.removeObserver(self,name: .AVPlayerItemDidPlayToEndTime,object: nil)
            
        }
        
        
        
    }
    
    

}

class Palabra: Codable, Identifiable {
    
    var fileName: String
    var word: String
    var type: String
    
    init(fileName: String, word: String, type: String) {
        self.fileName = fileName
        self.word = word
        self.type = type
    }
    
}


func cargaPalabras(course: String) -> [Palabra] {
    var ruta: String?
    
    ruta = Bundle.main.path(forResource: course, ofType: "plist")
    
    var listaPalabras = [Palabra]()
    
    do {
        var miurl = URL(fileURLWithPath: ruta ?? "")
        let data = try Data.init(contentsOf: miurl)
        
        listaPalabras = try PropertyListDecoder().decode([Palabra].self, from: data)
    }
    catch {
        print("Error al cargar archivo")
    }
    
    return listaPalabras
}
