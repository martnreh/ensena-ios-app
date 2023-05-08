//
//  InfoView.swift
//  Ensena-App
//
//  Created by Adrian Faz on 07/05/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            Text("Bienvenido a Enseña!")
            Image("MainLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
