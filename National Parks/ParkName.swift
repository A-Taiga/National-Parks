//
//  ParkName.swift
//  National Parks
//
//  Created by Anthony Polka on 8/20/21.
//

import SwiftUI

struct ParkName: View {
    
    var picture: String
    
    
    var body: some View {
    
        ZStack{
        
            Image(picture)
            .resizable()
            .ignoresSafeArea()
            .frame(width: nil, height: 259, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
            
            
            HStack{
            Text(picture)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .frame(width: 300, height: 300, alignment: .leading)
                .offset(x: -30, y: 80)
                .padding()
                
                
                
                
            }
        }
    }
}

struct ParkName_Previews: PreviewProvider {
    static var previews: some View {
       ParkName(picture: ContentView().names[0].name)
        
    }
}
