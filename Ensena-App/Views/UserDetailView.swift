//
//  UserDetailView.swift

//  Created by Adrian Faz on 16/11/22.
//

import SwiftUI

struct UserDetailView: View {
    @State var user : User = User()
    @State var detailId: String
    
    var body: some View {
        VStack{
            ProfileHeader(fullName: user.fullName, position: user.position, image: user.image)
            
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
                    .scaleEffect(x: 1, y: 3.5)
                    .frame(width: 280)
                    
                    Text("\(user.courseProgress)%").font(.system(size: 14, weight: .light))
                }
                
                Text("Cursos completados")
                    .padding(.top, 20)
                    .padding(.trailing, 170)
                    .font(.system(size: 15, weight: .light))
            
                ScrollView{
                
                    ForEach(user.completedCourses) {value in
                        
                        CourseTileProfileView(image: value.image, name: value.title
                        ).padding(.horizontal,30)
                    }
                    
                }
            
                
                
                
            Spacer()
        }
        }.onAppear {
            Task {
                await fetchUserInfoAdmin()
            }
        }
}
    
    func fetchUserInfoAdmin() async {
        
        let urlString = "http://127.0.0.1:5000/user/\(detailId)/info"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async{
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(User.self, from: data)
                    user = decodedData
                }catch{
                    
                            print("Error!")
                    }
                }
            }
        }.resume()
    }
    
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(detailId: "6364357674dfad2101e1f078")
    }
}

