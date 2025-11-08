//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 11/3/25.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    private let episodeDataUrl: URL?
    
    init(epidesodeDataUrl: URL?) {
        self.episodeDataUrl = epidesodeDataUrl
    }
}
