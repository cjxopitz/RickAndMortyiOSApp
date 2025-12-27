//
//  RMGetAllLocationsResponse.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/23/25.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMLocation]
    
}
