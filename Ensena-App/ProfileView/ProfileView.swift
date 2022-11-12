//
//  ProfileView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI



struct ProfileView: View {
    
    
    @StateObject private var model = ProfileViewModel()
    
    var body: some View {
        VStack{
            
            ProfileHeader(fullName: model.user.fullName, position: model.user.position)

            VStack{
            HStack (){
                Text("Progreso del curso")
                    .padding(.trailing, 182)
                    .font(.system(size: 15, weight: .light))
            }
                HStack{
                    ProgressView(value:
                                    Float(model.user.courseProgress), total: 100)
                    .accentColor(Color("Middle Blue"))
                    .scaleEffect(x: 1, y: 2.8)
                    .frame(width: 280)
                    
                    Text("\(model.user.courseProgress)%").font(.system(size: 14, weight: .light))
                }
                
                
                
                    
                Text("Cursos completados")
                    .padding(.top, 20)
                    .padding(.trailing, 170)
                    .font(.system(size: 15, weight: .light))
            }
            
            ScrollView{
            
                ForEach(model.user.completedCourses) {value in
                    
                    HStack{
                    
                        Image("fotoAbecedario")
                            .resizable()
                            .scaledToFit()
                            .frame(width:75)
                            .padding(3)
                            
                        
                        Text(value)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                        Spacer()
                    }.frame(width: 300, height: 70)
                    .background(Color("MiddleBlue"))
                    .cornerRadius(10)
                    }
            }.frame(height: 320)
            
           
            
            Spacer()
            
            Button {
                
        
                
             
            } label: {
            
                Text("Cerrar Sesión")
                    .padding(.horizontal,70)
                    .padding(.vertical, 10)
                    .font(.system(size: 22, weight: .semibold))
                    .background(Color("MidnightGreen"))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 35)
                    .padding(.bottom, 20)

            }
            
        }.onAppear{
            Task{
                await fetchUserInfo()
            }
        }
        
        
    }
    
    func fetchUserInfo() async {
        
        let urlString = "http://127.0.0.1:5000/user/6364328c74dfad2101e1f074/info"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async{
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(User.self, from: data)
                    model.user = decodedData
                }catch{
                            print("Error!")
                    }
                }
            }
        }.resume()
    }

    
   

}
        

struct ProfileHeader: View {
    
    var fullName: String
    var position: String
    
    var body: some View {
        VStack{
            Image("ProfileIcon")
                .resizable()
                .scaledToFit()
                .frame(width:130)
                .padding(.top, 10)
            
            Text(fullName)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .semibold))
                .padding(.top, 10)
                .padding(.bottom, 3)
            
            Text(position)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .light))
            
            Spacer()
            
            
        }.frame(width: 418, height: 260)
            .background(Color("MiddleBlue"))
            .padding(.bottom, 10)
    }
}





extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
