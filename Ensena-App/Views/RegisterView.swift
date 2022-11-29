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
    @State var infoLoaded : Int = 0

    
    
    let image1 = "https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg"
    let image2 = "https://i.pinimg.com/originals/96/42/e9/9642e9a02271760271028a3bc4f2e69c.jpg"
    let image3 = "https://i.pinimg.com/originals/32/32/73/323273cdf5b76b603eac387e1d1c6370.jpg"
    let image4 = "https://i.pinimg.com/736x/54/c6/ac/54c6ac041f5f299a4100d50075090ad2.jpg"
    @State var selectedImage = "Default"
    
    

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
                            TextField("Nombre", text: $name).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                        Text("Apellido *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "person")
                            TextField("Apellido", text: $lastname).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                        Text("Posición Laboral")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "case")
                            TextField("Posición Laboral", text: $position).autocapitalization(.none)
                        } .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                        
                        Text("E-mail")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "envelope")
                            TextField("ejemplo@gmail.com", text: $email).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                      
                        Text("Nombre de Usuario *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "person")
                            TextField("Usuario", text: $username).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                        
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
                            TextField("Contraseña", text: $password).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                        
                        Text("Confirmar Contraseña *")
                                .font(.callout)
                                .bold()
                        HStack {
                            Image(systemName: "lock")
                            TextField("Contraseña", text: $r_password).autocapitalization(.none)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(Color("Teal")))
                        
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
                                AsyncImage(url: URL(string: image1)) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 120, height: 120)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                
                                if(image1 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 120, height: 120)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                        Button {
                            selectedImage = image2
                        } label: {
                            ZStack{
                                AsyncImage(url: URL(string: image2)) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 120, height: 120)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                
                                if(image2 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 120, height: 120)
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
                                AsyncImage(url: URL(string: image3)) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 120, height: 120)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                
                                if(image3 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 120, height: 120)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                        Button {
                            selectedImage = image4
                        } label: {
                            ZStack{
                                AsyncImage(url: URL(string: image4)) { imagen in
                                    imagen.resizable()
                                
                                }  placeholder: {
                                    LoadingView(strong: false)

                                }
                                .frame(width: 120, height: 120)
                                    .cornerRadius(30)
                                    .padding(.horizontal, 20)
                                
                                if(image4 == selectedImage){
                                
                                    Rectangle()
                                           .foregroundColor(.clear)
                                           .background(LinearGradient(gradient: Gradient(colors: [.clear, Color("Teal")]), startPoint: .top, endPoint: .bottom))
                                           .frame(width: 120, height: 120)
                                           .cornerRadius(30)
                                }
                            }
                        }
                        
                    }.padding(.bottom, 20)
                   

                }
                
               
                    
            
            
            
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
                    .padding(.top, 30)
                    .padding(.bottom, 20)
            }.disabled(!checkRegisterInputs())
                
                VStack{
                    if(infoLoaded != 0){
                        if(infoLoaded == 2){
                            ProgressView()
                        }
                        else{
                        
                            if(mensaje == "" ){
                                Text("Usuario No registrable")
                                    .foregroundColor(.red)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                
                            }

                            else if (mensaje != "" && mensaje != "True") {
                                Text(mensaje)
                                    .foregroundColor(.red)
                                    .padding()
                                    .multilineTextAlignment(.center)
                                
                            }
                            else if (mensaje == "True") {
                                Text("Usario Registrado con Éxito")
                                    .foregroundColor(Color("Teal"))
                                    .padding()
                                    .multilineTextAlignment(.center)
                                
                            }
                            else if (mensaje == "False") {
                                Text("Nombre de Usuario ya utilizado")
                                    .foregroundColor(Color("Teal"))
                                    .padding()
                                    .multilineTextAlignment(.center)
                                
                            }
                            
                        }
                    
                    }
                    
                    
                    
               
                }.padding(.bottom, 30).onAppear(){
                    infoLoaded = 0
                }
            
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
            
            let result = try? JSONDecoder().decode(Response.self, from: data)
            
            infoLoaded = 3
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
        
        if (name.count > 4 && lastname.count > 4 && password.count > 8 && username.count > 6 && password == r_password && validatePassword(password: password) ){
    
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
        
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
