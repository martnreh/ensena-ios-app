//
//  ProfileView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI



struct ProfileView: View {
    
    
    
    @State var user : User = User()
    @State var infoLoaded: Bool = false
    
    @Binding var userId: String
    @Binding var isLoggedIn: Bool
    
    
    @State private var showingAlert = false

    
    var body: some View {
        
        
        VStack{
            if infoLoaded {
            VStack{
                
                ProfileHeader(fullName: user.fullName, position: user.position,image: "ProfileImage")

                VStack{
                HStack (){
                    Text("Progreso del curso")
                        .padding(.trailing, 182)
                        .font(.system(size: 15, weight: .light))
                }
                    HStack{
                        ProgressView(value:
                                        Float(user.courseProgress), total: 100)
                        .accentColor(Color("MiddleBlue"))
                        .scaleEffect(x: 1, y: 2.8)
                        .frame(width: 280)
                        
                        Text("\(user.courseProgress)%").font(.system(size: 14, weight: .light))
                    }
                    
                    
                    
                        
                    Text("Cursos completados")
                        .padding(.top, 20)
                        .padding(.trailing, 170)
                        .font(.system(size: 15, weight: .light))
                }
                
                ScrollView{
                
                    ForEach(user.completedCourses) {value in
                        
                        CourseTileProfileView(image: "ABC_Course", name: value)
                        }
                    
                }

                Spacer()
                Button {
                    showingAlert = true
                    
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
                }.alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("¿Seguro que quieres cerrar sesión?").font(.system(size: 15, weight: .light)),
                        message: Text("No podras guardar tu progreso").font(.system(size: 15, weight: .light)),
                        primaryButton: .destructive(Text("Cerrar Sesión").font(.system(size: 15, weight: .light))) {
                            userLogOut()
                        },
                        secondaryButton: .cancel(Text("Cancelar").font(.system(size: 15, weight: .light)))
                    )
                }
                
                Spacer()
                
            }
            }
            else{
                LoadingView(strong: false)
            }
            
            
        }
        .onAppear{
            Task{
                await fetchUserInfo()
            }
      
        }
       
            
        
        
    }
    
    func fetchUserInfo() async {
        
        let urlString = "http://127.0.0.1:5000/user/\(userId)/info"
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
    
    func userLogOut(){
        userId = ""
        isLoggedIn = false
        
    }

}
        

struct ProfileHeader: View {
    
    var fullName: String
    var position: String
    var image : String
    
    var body: some View {
        VStack{
            Image(image)
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


struct profileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(userId: .constant(""),isLoggedIn: .constant(false))
    }
}


extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct CourseTileProfileView: View {
    
    var image: String
    var name: String
   
    
    var body: some View {
        HStack{
        
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width:75)
                .padding(3)
                
            
            Text(name)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.leading, 10)
            Spacer()
        }.frame(width: 300, height: 70)
        .background(Color("MiddleBlue"))
        .cornerRadius(10)
        
        }
}



