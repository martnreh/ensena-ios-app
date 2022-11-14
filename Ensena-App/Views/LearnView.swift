//
//  LearnView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 11/11/22.
//

import SwiftUI



struct LearnView: View {
    
    @State var user = User()
    @State var infoLoaded  = false
    @Binding var userId: String
    @State var elementList = [Word]()
   
    
    var body: some View {
        
        
        if infoLoaded {
            VStack{
                // HEADER
                
             
                HStack{
                    
                    Text(currentCourseTitle)
                     
                        .frame(maxWidth: .infinity)
                        .padding(.init(top: 60, leading: 0, bottom: 20, trailing: 0))
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                        
                }.background(Color("CadetBlue"))
                Spacer()
                    
               
                ScrollView{
                            
                    ForEach(elementList) { element in
                        CourseElement(title: element.word, image: element.image )
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
                    await fetchUserInfo()
                }
            }
          }
        
        else{
            LoadingView(strong: false)
            
        }
    }
    
    
    func fetchUserInfo() async {
        
        var a = Word(word: "Letra A", image: "sign")
        var b = Word(word: "Letra B", image: "sign")
        elementList.append(a)
        elementList.append(b)
        
        let urlString = "http://127.0.0.1:5000/course/\(userId)/learn"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async{
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(User.self, from: data)
                    user = decodedData
                    infoLoaded = true
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
        LearnView(userId: .constant(""))
    }
}

// Each course
struct CourseElement: View {
    
    var title: String
    var image: String
    
    
    var body: some View {
        VStack() {
            
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(Color("MidnightGreen"))
                .padding(.top, 10)
            
           
            Image(image)
                .resizable()
                .frame(width: 310, height: 250)
                .cornerRadius(10)
                .padding(.bottom, 10)
                
            
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
    
    
    
}


