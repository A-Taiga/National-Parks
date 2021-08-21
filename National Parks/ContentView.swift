//
//  ContentView.swift
//  National Parks
//
//  Created by Anthony Polka on 8/20/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var names = [Data]()
    
   
    
    var body: some View {
        
        List(names, id: \.id) { i in

            ParkName(picture: i.name)
                .padding(.horizontal, -15.0)
                .frame(width: nil, height: 260, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
               
      
        }.onAppear(){
            Api().fetchData { (names) in
                self.names = names
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
           
        }
    }
}
