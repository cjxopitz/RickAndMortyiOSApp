//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 11/3/25.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    init(
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
    }
}
