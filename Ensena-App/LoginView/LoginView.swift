//
//  LoginView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import Foundation
import SwiftUI


struct LoginView: View {
    
    @StateObject private var model = LoginViewModel()

    var body: some View {

        VStack (spacing: 20){
            HStack(){
                Image(systemName: "arrow.backward").foregroundColor(.secondary)
            Button {
            }label: {
                Text("Atrás").foregroundColor(.secondary)
            }
            .padding(2)

            
            }.frame( width: 350, alignment: .leading)

            VStack(spacing: 20){
                
                
            Image("LogoPrincipal").padding(.vertical)
                .padding(.leading, 40)
                .padding(.bottom, 20)
  
            
            HStack{
                Image(systemName: "person.circle")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 10)
                    
                TextField("Usuario", text: $model.username)
                    .padding(.vertical, 15)
                    .autocapitalization(.none)
                    .padding(.trailing, 10)
                
                
                    
            }.background(Color("LightBlue"))
                .cornerRadius(50)
                .frame(width: 300)
            
            HStack{
                Image(systemName: "lock").foregroundColor(.gray)
                    .padding(.horizontal, 10)
                SecureField("Contraseña", text: $model.password).padding(.vertical, 15)
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
            
            
            if (!model.isLogged && model.change){
                Text("Usuario y contraseña incorrectos")
                    .foregroundColor(.red)
            } else if (model.isLogged && model.change){
                Text("Bienvenido!")
                    .foregroundColor(.green)
            }
            
            Spacer()
            
            
        }
        
    }
    
    func fetchData() async {
        guard let url = URL(string: "http://127.0.0.1:5000/user/login") else {
            print("No sirve el URL")
            return
        }
        
        let body: [String: String] = ["username": model.username, "password": model.password]
        
        guard let finalBody = try? JSONEncoder().encode(body) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(finalBody)
        print(model.isLogged)
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            
            guard let data = data, err == nil else {return}
            
            let result = try? JSONDecoder().decode(Response.self, from: data)
            
            
            if let result = result {
                DispatchQueue.main.async {
                    model.change = true

                    if(result.login) {
                        model.isLogged = true
                        //userId = result.userId
                    }
                }
            } else {
                model.isLogged = false
            }
            
        
        }.resume()

        
        
     
    }
    
    
        
        
   
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 11")
            .previewInterfaceOrientation(.portrait)
    }
}

struct Response: Codable
{
    var userId: String
    var login: Bool
    var admin: Bool
}
