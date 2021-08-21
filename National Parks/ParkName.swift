//
//  ParkName.swift
//  National Parks
//
//  Created by Anthony Polka on 8/20/21.
//

import SwiftUI

struct ParkName: View {
    
    @State var picture: String
    
    
    var body: some View {
       
        ZStack{
            
            
            
            Image(picture)
            .resizable()
            .ignoresSafeArea()
                .frame(width: nil, height: 200, alignment: .center)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
            .onDisappear()
            
            
            
            HStack{
            Text(picture)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .frame(width: 300, height: 300, alignment: .leading)
                .offset(x: -30, y: 60)
                .padding()
                
            }
        }
    }
}

struct ParkName_Previews: PreviewProvider {
    static var previews: some View {
       ParkName(picture: "placeholder")
        
    }
}

