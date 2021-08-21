//
//  ParkInfoView.swift
//  National Parks
//
//  Created by Anthony Polka on 8/21/21.
//

import SwiftUI
import MapKit

struct ParkLocation: Identifiable{
    var id = UUID()
    let coordinate: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double){
        self.id = id
            self.coordinate = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long)
    }
}





struct ParkInfoView: View {
    
    @State var cord = MKCoordinateRegion()
    @State var pin = CLLocationCoordinate2D()
    @State var name: String
    @State var info: [ParkInfo]
   
    
        
    
    var body: some View {
        
        VStack{
            
            
            
            //let annotation = [ParkLocation(lat: lat, long: long)]
            
        
            let place = ParkLocation(lat: pin.latitude, long: pin.longitude)
            VStack{
                
            Map(coordinateRegion: $cord, annotationItems: [place]) {
                place in MapPin(coordinate: pin)
            }
            .ignoresSafeArea(edges: .top)
            .frame(height: 400)
            
        
                HStack{
                    Text(info[0].name)
                        .font(.title)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        
                    Spacer()
                    
                }
                HStack{
                    Text(info[0].fullName)
                       .font(.subheadline)
                        .multilineTextAlignment(.leading)
                       .padding(.leading)
                                
                    Spacer()
                            
                        }
                Text(info[0].description)
                    .font(.body)
                    .padding([.top, .leading])
                    
                Spacer()
                    
                
            }
        }
    }
}

struct ParkInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ParkInfoView(cord: MKCoordinateRegion(), pin: CLLocationCoordinate2D(), name: "name", info: [])
    }
}
