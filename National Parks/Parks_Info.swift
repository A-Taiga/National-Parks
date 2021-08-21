//
//  Parks_Info.swift
//  National Parks
//
//  Created by Anthony Polka on 8/20/21.
//

import Foundation

struct Data: Codable, Identifiable {
    let id = UUID()
    let fullName: String
    let states: String
    let name: String
    let latitude: String
    let longitude: String
    let description: String
}




struct Parks: Codable, Identifiable {
    let id = UUID()
    let data: [Data]
}

class Api: ObservableObject {
    
    @Published var parks = [Parks]()
   
    
        //Api call
    func fetchData(completion: @escaping ([Data]) -> ()) {
        guard let url = URL(string: "https://developer.nps.gov/api/v1/parks?stateCode=TX&limit=999&api_key=XbAdGumIqKBvdKAHAqlWfQcNfiATmd6DMkQPde85") else {
            return
        }
        URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            let jsonResult = try! JSONDecoder().decode(Parks.self, from: data!)
           
          
            
           
            DispatchQueue.main.async {
                
             
                completion(jsonResult.data)
            }
           
        }.resume()
    }
    
    
    
}
