//
//  ContentView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI



let kMidnightGreen = Color(red: 0.050980392156862744, green: 0.3607843137254902, blue: 0.38823529411764707)

let kCadetBlue = Color(red: 0.26666666666666666, green: 0.6313725490196078, blue: 0.6274509803921569)

let kMiddleBlue = Color(red: 0.47058823529411764, green: 0.803921568627451, blue: 0.8431372549019608)

let kTeal = Color(red: 0.1411764705882353, green: 0.4823529411764706, blue: 0.4823529411764706)

var userId = 0
var cursoActual: String = "6364360774dfad2101e1f079"
var tituloCursoActual: String = "Abecedario I"

func updateUserId(){
    
    userId = 4
    
}

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white

    }

    var body: some View {
       
        TabView{
            DictionaryFazView().tabItem{
                Image(systemName: "book")
                Text("Diccionario")
            }
            
            CoursesView().tabItem{
                Image(systemName: "hand.point.up.left")
                Text("Cursos")
            }
            
            
            if userId == 0{
                LoginView().tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }
            }
            
            else{
                
                ProfileView().tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }
                
                
            }
            
            
           
            
        }.accentColor(kMidnightGreen)
        
       
    }
       
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
    
}



