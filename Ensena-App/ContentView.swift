//
//  ContentView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import SwiftUI




var currentCourseId: String = "6364360774dfad2101e1f079"
//userID
//6364357674dfad2101e1f078
var currentCourseTitle: String = "Abecedario I"





struct ContentView: View {
    
    
  
    @State var userId : String = "6364357674dfad2101e1f078"
    @State var isLoggedIn : Bool = true
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white

    }

    var body: some View {
       
        TabView{
            
            
            if (!isLoggedIn){
                LoginView(userId: $userId, isLoggedIn: $isLoggedIn).tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }
            }
            
            else{

                ProfileView(userId: $userId, isLoggedIn: $isLoggedIn).tabItem{
                    Image(systemName: "person")
                    Text("Perfil")
                }


            }
            
            
            CoursesView(userId: $userId).tabItem{
                Image(systemName: "hand.point.up.left")
                Text("Cursos")
            }

            DictionaryView().tabItem{
                Image(systemName: "book")
                    
                    
                Text("Diccionario")
            }
            
        }.accentColor(Color("MidnightGreen"))
        
    }
       
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
