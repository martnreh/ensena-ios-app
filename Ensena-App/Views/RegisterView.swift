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
    @State var showAlert : Bool = false
    
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
                    showAlert = true
                    infoLoaded = 2
                    
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
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title:
                                Text("Aviso de Privacidad").font(.system(size: 15, weight: .light)),
                                message: Text("De conformidad con lo establecido en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares, Jess Lefts pones a su disposición el siguiente aviso de privacidad.\n\nPablo Navarro Zepeda, es responsable del uso y protección de sus datos personales, en este sentido y atendiendo las obligaciones legales establecidas en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares, a través de este instrumento se informa a los titulares de los datos, la información que de ellos se recaba y los fines se le darán a dicha información.\n\nAdemás de lo anterior, informamos a usted que\nPablo Navarro Zepeda, tiene su domicilio ubicado en:\nPaseo Belinda 2901, Int.9, 66260, San Pedro Garza García, Nuevo León, México\n\nLos datos personales que recabamos de usted serán utilizados para las siguientes finalidades, las cuales son necesarias para concretar nuestra relación con usted, así como para atender los servicios y/o pedidos que solicite:\n\nMostrar información relacionada con el usuario.\nPoder identificar de forma única cada usuario.\nComo administrador, poder tener una noción del progreso de cada usuario.\n\nPara llevar a cabo las finalidades descritas en el presente aviso de privacidad, utilizaremos los siguientes datos personales:\n\nNombre, apellido, correo electrónico, puesto, nombre de usuario y contraseña.\n\nPor otra parte, informamos a usted, que sus datos personales serán compartidos con las siguientes autoridades, empresas, organizaciones o personas distintas a nosotros:\n\nJohn Deere,\nInstituto Tecnológico de Estudios Superiores de Monterrey.\n\nSu información personal será compartida exclusivamente para los fines que a continuación se mencionan:\n\nMonitorear el progreso o avance de los usuarios.\nPara obtener estadísticas que evalúen el producto.\n\nUsted tiene en todo momento el derecho de conocer qué datos personales tenemos de usted, para qué los utilizamos y las condiciones dl uso que les damos (Acceso). Asimismo, es su derecho solicitar la corrección de su información personal en caso de que esté desactualizada, sea inexacta o incompleta (Rectificación); de igual manera, tiene derecho a que su información se elimine de nuestros registros o así como también a oponerse al uso de sus datos personales para fines específicos (Oposición). Estos derechos se conocen como derechos ARCO.\n\nPara el ejercicio de cualquiera de los derechos ARCO, se deberá presentar la solicitud respectiva a través del siguiente correo electrónico:\na012284116@tec.mx\n\nLo anterior también servirá para conocer el procedimiento y requisitos para el ejercicio de los derechos ARCO.\n\nEn todo caso la respuesta a la solicitud se dará en el siguiente plazo: 3 días hábiles.\n\nLos datos de contacto de la persona o departamento de datos personales, que esta a cargo de dar trámite a las solicitudes de derechos ARCO, son los siguientes.\n\na) Nombre del responsable: Pablo Navarro Zepeda\nb) Domicilio: Paseo Belinda 2901, Int.9, 66260, San Pedro Garza García, Nuevo León, México\nc) Teléfono: 8120741882\nd) Correo electrónico: a01284116@tec.mx\n\nCabe mencionar, que en cualquier momento usted puede revocar su consentimiento para el uso de sus datos personales Del mismo modo, usted puede revocar el consentimiento que en su caso, nos haya otorgado para el tratamiento de sus datos personales.\n\nAsimismo, usted deberá considerar que para ciertos fines la revocación de su consentimiento implicará que no podamos seguir prestando el servicio que nos solicitó, o la conclusión de su relación con nosotros.\n\nPara revocar el consentimiento que usted otorga en este acto o para limitar su divulgación, se deberá presentar la solicitud respectiva a través del siguiente correo electrónico:\n\na01284116@tec.mx\n\nDel mismo modo, podrá solicitar la información para conocer el procedimiento y requisitos para la revocación del consentimiento, así como limitar el uso y divulgación de su información personal.\n\nEn cualquier caso, la respuesta a las peticiones se dará a conocer en el siguiente plazo: 3 días hábiles.\n\nÚltima actualización: 26/11/2022").font(.system(size: 15, weight: .light)),
                            
                                primaryButton: .default(Text("Aceptar").font(.system(size: 15, weight: .light)), action: {
                                    //Mostrar unica vez aviso de privacidad
                                    
                                    Task{
                                        await fetchRegister()
                                       
                                        
                                    }
                                    
                                }),
                            
                                secondaryButton: .destructive(Text("Negar").font(.system(size: 15, weight: .light))) {
                                    
                                    Task{
                                        infoLoaded = 0
                                        showAlert = false
                                        
                                    }
                                }
                               
                            )
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



