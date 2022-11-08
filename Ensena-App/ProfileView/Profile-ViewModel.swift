//
//  Profile-ViewModel.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 08/11/22.
//

import Foundation
import SwiftUI


extension ProfileView{
    
    
 
    
    @MainActor class ProfileViewModel:ObservableObject{
        
        
        @Published var user = User()
        
     
        @Published var username: String = ""
        @Published var password: String = ""
        @Published var change: Bool = false
        @Published  var isLogged: Bool = false
        
       
        
    }
}
