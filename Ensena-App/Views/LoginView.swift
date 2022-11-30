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
    @State var mensaje: String = ""
    @State var showAlertAgain: Bool = false
    @State var infoLoaded : Int = 0
    @Binding var showingPrivacyAdvice : Bool
    @Binding var userId: String
    @Binding var isLoggedIn: Bool
    @Binding var isAdmin: Bool
    
    
    
    var body: some View {
        
      
            
        NavigationView{
    
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
            
            }.padding(.top, 80).navigationBarHidden(true)
            
            
            
            
            Button {
                
                Task {
                    infoLoaded = 2
                    
                    if (checkLenghtInputs()){
                        await fetchData()
                        
                    }
                    
                    
                }
                
            } label: {
            
                Text("Inicia Sesión")
                    .padding(.horizontal,70)
                    .padding(.vertical, 10)
                    .font(.system(size: 22, weight: .semibold))
                    .background(checkLenghtInputs() ? Color("Teal") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 30)
            }.disabled(!checkLenghtInputs())
            
                
                VStack{
                    if(infoLoaded == 2){
                        ProgressView()
                    }
                    else{
                    
                        if(mensaje == "" && change && userId == ""){
                            Text("Usuario inexistente")
                                .foregroundColor(.red)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                        }
                        else if (mensaje == "" && !change) {
                            Text("")
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                            
                        }
                        else if (mensaje != "") {
                            Text(mensaje)
                                .foregroundColor(.red)
                                .padding()
                                .multilineTextAlignment(.center)
                            
                        }
                        
                    }
                    
                    
                    
               
                }.padding(.top, 10).onAppear(){
                    infoLoaded = 0
                }
                
                
            
            
            HStack{
                Text("¿Todavía no tienes una cuenta?")
                                .foregroundColor(.black)
                NavigationLink (destination: RegisterView()) {

                    Text("Registráte")
                                    .foregroundColor(Color("Teal"))
                                    .underline()
                              
                }.navigationBarBackButtonHidden(true)
                .simultaneousGesture(TapGesture().onEnded{
                 
                })
                
            }
            .padding(.top,10)
            
           
            
            
            
            Spacer()
        }.navigationBarTitle("Atrás")
            
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
                
                let result = try? JSONDecoder().decode(ResponseLogin.self, from: data)
                
                change = true
                infoLoaded = 3
                
                if let result = result {
                    DispatchQueue.main.async {
                        if(result.login) {
                            print(mensaje)
                            isLoggedIn = true
                            userId = result.userId
                            idUserGlobal = result.userId
                            isAdmin = result.admin
                            isAdminGlobal = result.admin
                        } else {
                            mensaje = result.message
                            print(mensaje)
                        }
                        
                       
                        
                    }
                }
                
            
            }.resume()
            
        }
    
    func checkLenghtInputs() -> Bool{
        
        if (username.count > 4 && password.count > 4 && username.count < 26 && password.count < 26){
            return true
        }
        else{
            return false
        }
        
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showingPrivacyAdvice:.constant(false), userId: .constant(""),isLoggedIn: .constant(false), isAdmin: .constant(false))
    }
}

struct ResponseLogin: Codable
{
    var userId: String
    var login: Bool
    var admin : Bool
    var message: String
}

