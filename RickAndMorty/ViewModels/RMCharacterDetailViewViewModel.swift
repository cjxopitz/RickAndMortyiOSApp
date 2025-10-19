//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 10/18/25.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
}
