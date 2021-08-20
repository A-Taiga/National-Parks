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
    
        List(names, id: \.id) { (i) in
            
            Text(i.fullName)
            
        }.onAppear(){
            Api().fetchData { (names) in
                
                self.names = names
               
    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
