//
//  LoginView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import Foundation
import SwiftUI


struct LoginView: View {
    
    
    @State var username: String = ""
    @State var password: String = ""
    @State var change: Bool = false
    
    @Binding var userId: String
    @Binding var isLoggedIn: Bool
    @Binding var isAdmin: Bool
    
    
    var body: some View {
        
        if(!isLoggedIn){

        VStack (spacing: 20){

            VStack(spacing: 20){
                
                
            Image("MainLogo").padding(.vertical)
                .padding(.leading, 40)
                .padding(.bottom, 20)
  
            
            HStack{
                Image(systemName: "person.circle")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 20)
                    
                TextField("Usuario", text: $username)
                    .padding(.vertical, 15)
                    .autocapitalization(.none)
                    .padding(.trailing, 10)
                
                
                    
            }.background(Color("LightBlue"))
                .cornerRadius(50)
                .frame(width: 300)
            
            HStack{
                Image(systemName: "lock").foregroundColor(.gray)
                    .padding(.horizontal, 20)
                SecureField("Contraseña", text: $password).padding(.vertical, 15)
                    .padding(.trailing, 10)
                    .autocapitalization(.none)
                
                    
            }.background(Color("LightBlue"))
                .cornerRadius(50)
                .frame(width: 300)
            
            }.padding(.top, 80)
            Button {
                Task {
                    await fetchData()
                }
                
            } label: {
            
                Text("Inicia Sesión")
                    .padding(.horizontal,70)
                    .padding(.vertical, 10)
                    .font(.system(size: 22, weight: .semibold))
                    .background(Color("Teal"))
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 80)
                    .padding(.bottom, 20)

            }
            
            if (!isLoggedIn && change){
                VStack{
                    Text("Usuario y contraseña incorrectos")
                        .foregroundColor(.red)
                }
               
            }
            Spacer()
        }
        }
        
        else{
            ProfileView(userId: $userId, isLoggedIn: $isLoggedIn)
            
        }
    }
    
    func fetchData() async {
            guard let url = URL(string: "http://127.0.0.1:5000/user/login") else {
                print("No sirve el URL")
                return
            }
            
            let body: [String: String] = ["username": username, "password": password]
            
            guard let finalBody = try? JSONEncoder().encode(body) else {
                return
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.httpBody = finalBody
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, res, err) in
                
                guard let data = data, err == nil else {return}
                
                let result = try? JSONDecoder().decode(Response.self, from: data)
                
                change = true
                
                if let result = result {
                    DispatchQueue.main.async {
                        if(result.login) {
                            isLoggedIn = true
                            userId = result.userId
                            idUserGlobal = result.userId
                            isAdmin = result.admin
                        }
                        
                       
                        
                    }
                }
                
            
            }.resume()
        }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(userId: .constant(""),isLoggedIn: .constant(false), isAdmin: .constant(false))
    }
}

struct Response: Codable
{
    var userId: String
    var login: Bool
    var admin : Bool
}

