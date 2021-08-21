//
//  ContentView.swift
//  National Parks
//
//  Created by Anthony Polka on 8/20/21.
//

import SwiftUI
import MapKit


struct ParkLocal: Identifiable{
    let id = UUID()
    let name: String
    let lat: Double
    let long: Double

    
}
struct ParkInfo: Identifiable {
    let id = UUID()
    let fullName: String
    let name: String
    let description: String
}



struct ContentView: View {
    
    
    @State var names = [Data]()
    
    
   
    
    var body: some View {
        
        NavigationView{
        
            ScrollView{
            ForEach(names, id: \.id) { i in
              
                    LazyVStack{
                       
                        ZStack{
                  
                            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: (i.latitude as NSString).doubleValue , longitude: (i.longitude as NSString).doubleValue), span: MKCoordinateSpan(latitudeDelta: 3, longitudeDelta: 3))
                            
                            let annotation = CLLocationCoordinate2D(latitude: (i.latitude as NSString).doubleValue, longitude: (i.longitude as NSString).doubleValue)
                            
                        
                            NavigationLink(destination: ParkInfoView(cord: region, pin: annotation, name: i.fullName, info: [ParkInfo.init(fullName: i.fullName, name: i.name, description: i.description)]),label: {
                          
                            ParkName(picture: i.name)
                                 .navigationBarTitle("Texas Parks")
                                 .padding(.horizontal, -15.0)
                                 .frame(width: nil, height: 200, alignment: .center)
                        })
                    }
                }
            }
        }
    }
        .onAppear(){
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
