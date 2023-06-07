//
//  DogList.swift
//  WebServices
//
//  Created by Gaurang Naik on 2023-06-05.
//

import Foundation

struct Dogs: Codable {
    var message:[String:[String]]
    var status:String
    
    init() {
        self.message = ["":[""]]
        self.status = ""
    }
}




