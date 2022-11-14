//
//  LoadingView.swift
//  Ensena-App
//
//  Created by Adrian Martin Hernandez  on 14/11/22.
//

import SwiftUI

struct LoadingView: View {
    
    @State var strong: Bool = false
    var body: some View {
        
        if(strong){
            ZStack{
                Color("Teal").ignoresSafeArea()
                ProgressView()
                    .scaleEffect(1)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
        else{
            ZStack{
                Color(.white).ignoresSafeArea()
                ProgressView()
                    .scaleEffect(1)
                    .progressViewStyle(CircularProgressViewStyle(tint: Color("Teal")))
            }

        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
