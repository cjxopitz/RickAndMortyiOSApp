//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 9/22/25.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    //'Alive', 'Dead', or 'Unknown'
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}
