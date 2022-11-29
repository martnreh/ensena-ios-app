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
    @State var infoLoaded : Int = 0

    
    
    let image1 = "dog"
    let image2 = "cat"
    let image3 = "bird"
    let image4 = "landscape"
    @State var selectedImage = "default"
    
    

    var body: some View {
        ScrollView{
            VStack{
                Text("Registro")
                    .font(.system(size: 50))
                        .bold()
                        .padding(.bottom, 15)
                        .foregroundColor(Color("Teal"))
                Text("Al registrar una cuenta podrás guardar tu progreso en todos los diferentes cursos de Lenguaje de Señas Mexicanas que tenemos para ti. ")
                    .font(.system(size: 15))
                        .padding(.bottom, 20)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
        
                VStack(alignment: .leading){
                    
                    Group{
                        Text("Nombre *")
                                .font(.callout)
                                .bold()
                    
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(name.count > 4 ? Color("Teal") : .gray)
                            TextField("Nombre", text: $name).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(name.count > 4 ? Color("Teal") : .gray))
                        ///////////////////
                        Text("Apellido *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(lastname.count > 4 ? Color("Teal") : .gray)
                            TextField("Apellido", text: $lastname).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(lastname.count > 4 ? Color("Teal") : .gray))
                        
                        ///////////////////
                        Text("Posición Laboral")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "case")
                                .foregroundColor(position.count > 4 ? Color("Teal") : .gray)
                            TextField("Posición Laboral", text: $position).autocapitalization(.none)
                        } .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(position.count > 4 ? Color("Teal") : .gray))
                        
                        ///////////////////
                        Text("E-mail *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(email.count > 4 && validateEmail(email: email) ? Color("Teal") : .gray)
                            TextField("ejemplo@gmail.com", text: $email).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(email.count > 4 && validateEmail(email: email) ? Color("Teal") : .gray))
                        
                        ///////////////////
                        Text("Nombre de Usuario *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(username.count > 4 ? Color("Teal") : .gray)
                            TextField("Usuario", text: $username).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(username.count > 4 ? Color("Teal") : .gray))
                        
                    }
                
                    
                    Group{
                        Text("Crear Contraseña * (min. 8 letras)")
                                .font(.callout)
                                .bold()
                        Text("Debe incluir: mayúscula,número y carácter especial ")
                            .font(.system(size: 15))
                                .foregroundColor(.gray)
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(validatePassword(password: password) ? Color("Teal") : .gray)
                            TextField("Contraseña", text: $password).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(validatePassword(password: password) ? Color("Teal") : .gray))
                        
                        ///////////////////
                        Text("Confirmar Contraseña *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(r_password == password && r_password.count > 4 ? Color("Teal") : .gray)
                            TextField("Contraseña", text: $r_password).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(r_password == password && r_password.count > 4 ? Color("Teal") : .gray))
                        
                    }
                    
                    Text("Selecciona una imagen para tu Perfil")
                            .font(.callout)
                            .bold()
                    
                }
                
                
                VStack{
                    HStack{
                        
                        Button {
                            selectedImage = image1
                        } label: {
                            ZStack{
                                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/ensena-3e13a.appspot.com/o/profileImgs%2FPerro.jpg?alt=media&token=8380d6b2-adec-4039-9ace-a9e450e44a3b")) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 140, height: 140)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                    .shadow(color: selectedImage == image1 ?Color("Teal") : .black, radius: 1, x: 3, y: 5)
                                
                                if(image1 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 140, height: 140)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                        Button {
                            selectedImage = image2
                        } label: {
                            ZStack{
                                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/ensena-3e13a.appspot.com/o/profileImgs%2FGato.jpg?alt=media&token=581c6920-f6fb-49a5-9e3b-c84e5624ba1e")) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 140, height: 140)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                    .shadow(color: selectedImage == image2 ?Color("Teal") : .black, radius: 1, x: 3, y: 5)
                                
                                if(image2 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 140, height: 140)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                    }.padding(.bottom, 20)
                    HStack{
                        
                        Button {
                            selectedImage = image3
                        } label: {
                            ZStack{
                                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/ensena-3e13a.appspot.com/o/profileImgs%2FPajaro.jpg?alt=media&token=666c3fe1-b20e-4687-8a01-ceaed10d91e4")) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)
                                    
                                }
                                .frame(width: 140, height: 140)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                    .shadow(color: selectedImage == image3 ?Color("Teal") : .black, radius: 1, x: 3, y: 5)
                                
                                if(image3 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 140, height: 140)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                        Button {
                            selectedImage = image4
                        } label: {
                            ZStack{
                                AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/ensena-3e13a.appspot.com/o/profileImgs%2FPaisaje.jpg?alt=media&token=81ca1536-90d0-4682-82ce-caa7dc099e8d")) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 140, height: 140)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                    .shadow(color: selectedImage == image4 ?Color("Teal") : .black, radius: 1, x: 3, y: 5)
                                
                                if(image4 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 140, height: 140)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                    }
                   

                }
                
                VStack{
                    if(infoLoaded != 0){
                        if(infoLoaded == 2){
                            ProgressView()
                        }
                        else{
                        
                                if(mensaje == "Usuario creado correctamente" ){
                                    Text(mensaje)
                                        .foregroundColor(Color("Teal"))
                                        .padding()
                                        .multilineTextAlignment(.center)
                                    
                                }

                                else if (mensaje == "Usuario o correo ya existente") {
                                    Text(mensaje)
                                        .foregroundColor(.red)
                                        .padding()
                                        .multilineTextAlignment(.center)
                                    
                                }
                        }
                    
                    }
                }.padding(.vertical,20)
                    
        
            Button {
                Task{
                    infoLoaded = 2
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
                    .padding(.bottom, 100)
            }.disabled(!checkRegisterInputs())
                
                
            
        }.padding(.horizontal, 30)
        }
    }
    
    func fetchRegister() async {
        
        
        guard let url = URL(string: "http://127.0.0.1:5000/user/register") else {
            print("No sirve el URL")
            return
        }
        
        let body: [String: String] = ["name": name, "lastname": lastname, "position": position, "email" : email , "username" : username , "password" : password, "image": selectedImage]
        
        
        guard let finalBody = try? JSONEncoder().encode(body) else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            
            guard let data = data, err == nil else {return}
            
            let result = try? JSONDecoder().decode(ResponseRegister.self, from: data)
            infoLoaded = 3
            if let result = result {
                DispatchQueue.main.async {
                    mensaje = result.message
                    print(mensaje)
                    print("Aaaaa")
                    
                }
            }
            
        
        }.resume()
    }
    
    func checkRegisterInputs() -> Bool{
        
        if (name.count > 4 && lastname.count > 4 && password.count > 8 && username.count > 6 && password == r_password && email.count > 4 && validatePassword(password: password) ){
    
                return true
           
           
        }
        else{
            return false
        }
                
    }
    
    func validatePassword(password: String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        guard texttest.evaluate(with: password) else { return false }

        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        guard texttest1.evaluate(with: password) else { return false }

        let specialCharacterRegEx  = ".*[!&.^%$#@()/_*+-]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        guard texttest2.evaluate(with: password) else { return false }

        return true
    }
    func validateEmail(email: String) -> Bool {

        let mailRegEx  = ".*[.@.]+.*"
        let texttest3 = NSPredicate(format:"SELF MATCHES %@", mailRegEx)
        guard texttest3.evaluate(with: email) else { return false }

        return true
    }
        
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


struct ResponseRegister: Codable
{
    var message: String
}



