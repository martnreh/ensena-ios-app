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
    @Binding var showingPrivacyAdvice : Bool
    @Binding var userId: String
    @Binding var isLoggedIn: Bool
    @Binding var isAdmin: Bool
    
    
    var body: some View {
        
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
            
            
            Text("Registrarse")
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                
                            }.padding(.top, 30)
            
            Button {
                Task {
                    
                    if (checkLenghtInputs() && !showAlertAgain && !showingPrivacyAdvice){
                        await fetchData()
                        
                    }
                    if(showingPrivacyAdvice && !showAlertAgain){
                        showAlertAgain = true
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
                    .padding(.bottom, 20)
            }.disabled(!checkLenghtInputs())
            .alert(isPresented: $showAlertAgain) {
                Alert(
                    title:
                        Text("Aviso de Privacidad").font(.system(size: 15, weight: .light)),
                        message: Text("(nombre completodel sujeto obligado), con domicilio en (describir datos del domicilio) es el responsable del tratamiento de los datos personales que nos proporcione, los cuales serán protegidos conforme a lo dispuesto por la Ley de Protección de Datos Personales en Posesión de Sujetos Obligados del Estado de Oaxaca, y demás normatividad que resulte aplicable. 1.Finalidades del tratamiento \n Los datos personales que recabamos de usted, los utilizaremos para las siguientes finalidades: \n (enunciar las finalidades principales y obligatorias)\n De manera adicional, utilizaremos su información personal para las siguientes finalidades que no son necesarias, pero que nos permiten y facilitan brindarle una mejor atención: (describir las finalidades secundarias que requieran el consentimiento del titular)\n En caso de que no desee que sus datos personales sean tratados para estos fines adicionales, esta plataforma le permitirá indicarlo o usted puede manifestarlo así al correo electrónico\n(Este enunciado puede variar de acuerdo al mecanismo por el que se dé a conocer el aviso de privacidad)\n2. Datos personales recabados que nos proporcione, los cuales serán protegidos conforme a lo dispuesto por la Ley de Protección de Datos Personales en Posesión de Sujetos Obligados del Estado de Oaxaca, y demás normatividad que resulte aplicable. 1.Finalidades del tratamiento \n Los datos personales que recabamos de usted, los utilizaremos para las siguientes finalidades: \n (enunciar las finalidades principales y obligatorias)\n De manera adicional, utilizaremos su información personal para las siguientes finalidades que no son necesarias, pero que nos pe que nos proporcione, los cuales serán protegidos conforme a lo dispuesto por la Ley de Protección de Datos Personales en Posesión de Sujetos Obligados del Estado de Oaxaca, y demás normatividad que resulte aplicable. 1.Finalidades del tratamiento \n Los datos personales que recabamos de usted, los utilizaremos para las siguientes finalidades: \n (enunciar las finalidades principales y obligatorias)\n De manera adicional, utilizaremos su información personal para las siguientes finalidades que no son necesarias, pero que nos pe que nos proporcione, los cuales serán protegidos conforme a lo dispuesto por la Ley de Protección de Datos Personales en Posesión de Sujetos Obligados del Estado de Oaxaca, y demás normatividad que resulte aplicable. 1.Finalidades del tratamiento \n Los datos personales que recabamos de usted, los utilizaremos para las siguientes finalidades: \n (enunciar las finalidades principales y obligatorias)\n De manera adicional, utilizaremos su información personal para las siguientes finalidades que no son necesarias, pero que nos pe").font(.system(size: 15, weight: .light)),
                    
                        primaryButton: .default(Text("Aceptar").font(.system(size: 15, weight: .light)), action: {
                            //Mostrar unica vez aviso de privacidad
                            
                            Task{
                                showAlertAgain = false
                                showingPrivacyAdvice = false
                                await fetchData()
                                
                            }
                            
                        }),
                    
                        secondaryButton: .destructive(Text("Negar").font(.system(size: 15, weight: .light))) {
                            
                            Task{
                                showingPrivacyAdvice = true
                                
                            }
                        }
                       
                    )
            }
            
            if (mensaje != "") {
                VStack{
                    
                    Text(mensaje)
                        .foregroundColor(.red)
                        .padding()
                        .multilineTextAlignment(.center)
                    
               
            }
            }
            Spacer()
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
        
        if (username.count > 4 && password.count > 4){
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

struct Response: Codable
{
    var userId: String
    var login: Bool
    var admin : Bool
    var message: String
}

