//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 9/22/25.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    //'Alive', 'Dead', or 'unknown'
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}

/*
I have an error like
dataCorrupted(Swift.DecodingError.Context(codingPath: [CodingKeys(stringValue: "results", intValue: nil), _JSONKey(stringValue: "Index 6", intValue: 6), CodingKeys(stringValue: "status", intValue: nil)], debugDescription: "Cannot initialize RMCharacterStatus from invalid String value unknown", underlyingError: nil))

@awakeFromNib  I solved this problem. I fixed the RMCharacterStatus enum. The cases "Alive" , "Dead" and 'unknown' should be same from the API documentation. The fixed version of the RMCharacterStatus is :

import Foundation
enum RMCharacterStatus: String, Codable {
   
   case Alive = "Alive"
   case Dead = "Dead"
   case `unknown` = "unknown"
   
   var text : String {
       switch self {
       case .Alive, .Dead:
           return rawValue
       case .unknown:
           return "Unknown"
       }
   }
*/
