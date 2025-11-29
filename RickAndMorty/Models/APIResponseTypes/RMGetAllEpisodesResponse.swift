//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 11/25/25.
//

import Foundation

struct RMGetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    
    let info: Info
    let results: [RMEpisode]
    
}
