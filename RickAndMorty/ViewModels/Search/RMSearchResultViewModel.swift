//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 1/11/26.
//

import Foundation

enum RMSearchResultViewModel {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
