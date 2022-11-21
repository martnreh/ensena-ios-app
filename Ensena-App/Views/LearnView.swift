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
    
  
    @State var infoLoaded  = true
    var courseId: String
    var courseName: String
    @State var wordList : [Learn.Wordd] = []
   
    
    var body: some View {
        
        
        if infoLoaded {
            VStack{
                // HEADER
                
             
                HStack{
                    
                    Text(courseName)
                     
                        .frame(maxWidth: .infinity)
                        .padding(.init(top: 60, leading: 0, bottom: 20, trailing: 0))
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        
                }.background(Color("CadetBlue"))
                Spacer()
                    
               
                ScrollView{
                            
                    ForEach(wordList) { element in
                        CourseElement(title: element.word, image: element.url, type: element.type)
                        
                    }
                    
                    
                    // Boton para ir a practica
                    Button {
                        // ACCION
                        
                    } label: {
                    
                        Text("Practica")
                            .padding(.horizontal,70)
                            .padding(.vertical, 10)
                            .font(.system(size: 22, weight: .semibold))
                            .background(Color("Teal"))
                            .cornerRadius(50)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                    }

                }
                
                
                Spacer()

            }
            .edgesIgnoringSafeArea(.all)
            .onAppear{
                Task{
                    await fetchInfo()
                }
            }
          }
        
        else{
            LoadingView(strong: false)
            
        }
    }
    
    
    func fetchInfo() async {
        
        
        let urlString = "http://127.0.0.1:5000/course/\(courseId)/learn"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async{
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    print("PPPPPPPPP")
                    let decodedData = try decoder.decode(Learn.self, from: data)
                    print("000000000")
                  
                    DispatchQueue.main.async{
                        
                        self.wordList = decodedData.wordList
                        self.infoLoaded = true
                        
                    }
                   
                }catch{
                            print("Error!")
                    }
                }
            }
        }.resume()
    }
      
    
}


struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(courseId: "", courseName: "")
    }
}

// Each course
struct CourseElement: View {
    
    var title: String
    var image: String
    var type: String
    @State private var player : AVPlayer?
    
    
    var body: some View {
        
        
        
        VStack() {
            
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color("MidnightGreen"))
                .padding(.top, 10)
            
            
            if (type == "img") {
            
            AsyncImage(url: URL(string: image)) { imagen in
                imagen.resizable()
            }  placeholder: {
                Color("CadetBlue")
            }
            .frame(width: 310, height: 250)
                .cornerRadius(10)
                .padding(.bottom, 10)
                
            } else if (type == "vid"){
                
                let myUrl = URL(string: image)!
                let player = AVPlayer(url: myUrl)
                        
                
                VideoPlayer(player: player)
                    .frame(height: 263)
                            .onAppear() {
                                player.play()
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


