//
//  RegisterView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 27/11/22.
//

import SwiftUI

struct RegisterView: View {
    @State var mensaje: String = ""
    @State var name: String = ""
    @State var lastname: String = ""
    @State var position: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var r_password: String = ""
    @State var image: String = ""
    let columns = [
            GridItem(.flexible(minimum: 90), spacing: 20),
            GridItem(.flexible(minimum: 90), spacing: 20),
            
        ]
    
    

    var body: some View {
        ScrollView{
            VStack{
                Text("Registro")
                    .font(.system(size: 50))
                        .bold()
                        .padding(.bottom, 15)
                        .foregroundColor(Color("Teal"))
                Text("Al registrar una cuenta podrás guardar tu progreso en todos los diferentes cursos de Lenguaje de Señas Mexicanas que tenemos para ti ")
                    .font(.system(size: 15))
                        .padding(.bottom, 20)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
        
                VStack(alignment: .leading){
                    
                    Group{
                        Text("Nombre")
                                .font(.callout)
                                .bold()
                    
                        TextField("Nombre", text: $name)
                                        .frame(height: 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        Text("Apellido")
                                .font(.callout)
                                .bold()
                        TextField("Apellido", text: $lastname)
                                        .frame(height: 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        Text("Posición Laboral")
                                .font(.callout)
                                .bold()
                        TextField("Posición Laboral", text: $position)
                                        .frame(height: 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        Text("E-mail")
                                .font(.callout)
                                .bold()
                        TextField("e-mail", text: $email)
                                        .frame(height: 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        Text("Nombre de Usario")
                                .font(.callout)
                                .bold()
                        TextField("Usuario", text: $username)
                                        .frame(height: 40)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        
                    }
                
                    
                    Group{
                        Text("Crear Contraseña")
                                .font(.callout)
                                .bold()
                        TextField("Contraseña", text: $password)
                                        .frame(height: 60)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        Text("Confirmar Contraseña")
                                .font(.callout)
                                .bold()
                        TextField("Contraseña", text: $r_password)
                                        .frame(height: 60)
                                        .textFieldStyle(RoundedBorderTextFieldStyle())
                                        .autocapitalization(.none)
                        Text("Selecciona Imagen de Usuario")
                                .font(.callout)
                                .bold()
                    }
                    
                }
                
                LazyVGrid(columns: columns) {
                    
                    VStack{
                        AsyncImage(url: URL(string: "https://www.accreditedlanguage.com/wp-content/uploads/2016/08/sign-language.jpg")) { imagen in
                            imagen.resizable()
                        
                        }  placeholder: {
                            LoadingView(strong: false)

                        }
                        .frame(width: 120, height: 120)
                            .cornerRadius(30)
                            .padding(.bottom, 10)
                        AsyncImage(url: URL(string: "https://acutrans.com/wp-content/uploads/2020/08/ASL.png")) { imagen in
                            imagen.resizable()
                        
                        }  placeholder: {
                            LoadingView(strong: false)

                        }
                        .frame(width: 120, height: 120)
                            .cornerRadius(30)
                            .padding(.bottom, 10)
                        
                    }
                    VStack{
                        AsyncImage(url: URL(string: "https://www.splashlearn.com/blog/wp-content/uploads/2021/12/ASL.jpg")) { imagen in
                            imagen.resizable()
                        
                        }  placeholder: {
                            LoadingView(strong: false)

                        }
                        .frame(width: 120, height: 120)
                            .cornerRadius(30)
                            .padding(.bottom, 10)
                        AsyncImage(url: URL(string: "https://www.calliope-interpreters.org/sites/all/files/upload/asl.jpg")) { imagen in
                            imagen.resizable()
                        
                        }  placeholder: {
                            LoadingView(strong: false)

                        }
                        .frame(width: 120, height: 120)
                            .cornerRadius(30)
                            .padding(.bottom, 10)
                        
                    }

                }
                    
            
            
            
            Button {
                Task{
                    
                    await fetchRegister()
                    
                }
               
                    
                
            } label: {
            
                Text("Registrar")
                    .padding(.horizontal,70)
                    .padding(.vertical, 10)
                    .font(.system(size: 22, weight: .semibold))
                    .background(checkRegisterInputs() ? Color("Teal") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 30)
                    .padding(.bottom, 20)
            }
            
        }.padding(.horizontal, 30)
        }
    }
    
    func fetchRegister() async {
        
        
        guard let url = URL(string: "http://127.0.0.1:5000/user/register") else {
            print("No sirve el URL")
            return
        }
        
        //let body: [String: String] = ["name": name, "lastName": lastName, "position": position, "email" : email , "user" : user , "password" : password]
        
        let body: [String: String] = ["name": "Martin", "lastname": "barrientos", "position": "software", "email" : "a01570656@tec.mx" , "username" : "a01570656" , "password" : "12345678", "image" : "Default"]
        
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
            
            
            if let result = result {
                DispatchQueue.main.async {
                    if(result.login) {
                        
                    } else {
                        mensaje = result.message
                        print(mensaje)
                    }
                    
                   
                    
                }
            }
            
        
        }.resume()
    }
    
    func checkRegisterInputs() -> Bool{
        
        if (name.count > 4 && password.count > 4 && password == r_password){
            return true
        }
        else{
            return false
        }
        
        
    }
        
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
