//
//  Content-ViewModel.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 07/11/22.
//

import Foundation
import SwiftUI


extension ContentView{
    
    @MainActor class ContentViewModel:ObservableObject{
        
     
       
        @Published var userId = 0
        
        
       
        
        func updateUserId (){
  
           userId = 5
            
        }
    }
}
