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
            }.disabled(!checkLenghtInputs())
            .alert(isPresented: $showAlertAgain) {
                Alert(
                    title:
                        Text("Aviso de Privacidad").font(.system(size: 15, weight: .light)),
                        message: Text("De conformidad con lo establecido en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares, Jess Lefts pones a su disposición el siguiente aviso de privacidad.\n\nPablo Navarro Zepeda, es responsable del uso y protección de sus datos personales, en este sentido y atendiendo las obligaciones legales establecidas en la Ley Federal de Protección de Datos Personales en Posesión de los Particulares, a través de este instrumento se informa a los titulares de los datos, la información que de ellos se recaba y los fines se le darán a dicha información.\n\nAdemás de lo anterior, informamos a usted que\nPablo Navarro Zepeda, tiene su domicilio ubicado en:\nPaseo Belinda 2901, Int.9, 66260, San Pedro Garza García, Nuevo León, México\n\nLos datos personales que recabamos de usted serán utilizados para las siguientes finalidades, las cuales son necesarias para concretar nuestra relación con usted, así como para atender los servicios y/o pedidos que solicite:\n\nMostrar información relacionada con el usuario.\nPoder identificar de forma única cada usuario.\nComo administrador, poder tener una noción del progreso de cada usuario.\n\nPara llevar a cabo las finalidades descritas en el presente aviso de privacidad, utilizaremos los siguientes datos personales:\n\nNombre, apellido, correo electrónico, puesto, nombre de usuario y contraseña.\n\nPor otra parte, informamos a usted, que sus datos personales serán compartidos con las siguientes autoridades, empresas, organizaciones o personas distintas a nosotros:\n\nJohn Deere,\nInstituto Tecnológico de Estudios Superiores de Monterrey.\n\nSu información personal será compartida exclusivamente para los fines que a continuación se mencionan:\n\nMonitorear el progreso o avance de los usuarios.\nPara obtener estadísticas que evalúen el producto.\n\nUsted tiene en todo momento el derecho de conocer qué datos personales tenemos de usted, para qué los utilizamos y las condiciones dl uso que les damos (Acceso). Asimismo, es su derecho solicitar la corrección de su información personal en caso de que esté desactualizada, sea inexacta o incompleta (Rectificación); de igual manera, tiene derecho a que su información se elimine de nuestros registros o así como también a oponerse al uso de sus datos personales para fines específicos (Oposición). Estos derechos se conocen como derechos ARCO.\n\nPara el ejercicio de cualquiera de los derechos ARCO, se deberá presentar la solicitud respectiva a través del siguiente correo electrónico:\na012284116@tec.mx\n\nLo anterior también servirá para conocer el procedimiento y requisitos para el ejercicio de los derechos ARCO.\n\nEn todo caso la respuesta a la solicitud se dará en el siguiente plazo: 3 días hábiles.\n\nLos datos de contacto de la persona o departamento de datos personales, que esta a cargo de dar trámite a las solicitudes de derechos ARCO, son los siguientes.\n\na) Nombre del responsable: Pablo Navarro Zepeda\nb) Domicilio: Paseo Belinda 2901, Int.9, 66260, San Pedro Garza García, Nuevo León, México\nc) Teléfono: 8120741882\nd) Correo electrónico: a01284116@tec.mx\n\nCabe mencionar, que en cualquier momento usted puede revocar su consentimiento para el uso de sus datos personales Del mismo modo, usted puede revocar el consentimiento que en su caso, nos haya otorgado para el tratamiento de sus datos personales.\n\nAsimismo, usted deberá considerar que para ciertos fines la revocación de su consentimiento implicará que no podamos seguir prestando el servicio que nos solicitó, o la conclusión de su relación con nosotros.\n\nPara revocar el consentimiento que usted otorga en este acto o para limitar su divulgación, se deberá presentar la solicitud respectiva a través del siguiente correo electrónico:\n\na01284116@tec.mx\n\nDel mismo modo, podrá solicitar la información para conocer el procedimiento y requisitos para la revocación del consentimiento, así como limitar el uso y divulgación de su información personal.\n\nEn cualquier caso, la respuesta a las peticiones se dará a conocer en el siguiente plazo: 3 días hábiles.\n\nÚltima actualización: 26/11/2022").font(.system(size: 15, weight: .light)),
                    
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

