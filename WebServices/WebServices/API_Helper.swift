//
//  API_Helper.swift
//  WebServices
//
//  Created by Gaurang Naik on 2023-06-05.
//

import Foundation

enum DogAPI_Errors: Error {

        case cannotConvertURL
}


class DogAPI_Helper {
    
    private static var baseURLString =  "https://dog.ceo/api/breeds/list/all"
    
    public static func fetch(urlString:String) async throws -> Data {
        
        guard
            let url = URL(string: urlString)
        else { throw DogAPI_Errors.cannotConvertURL }
        
        let (data,_) = try await URLSession.shared.data(from:url)
       // print(data.first)
        return data
    }
    
    public static func fetchDogs() async throws -> Dogs {
        
        do
        {
            let data = try await fetch(urlString: baseURLString)
           // print(data)
            let decoder = JSONDecoder()
            
            let message = try decoder.decode(Dogs.self, from: data)
            
            return message
            
        } catch {
            
                fatalError("\(error)")
        }
    }
}
