//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/28/25.
//

import Foundation

// Responsibilities
// - show no results view
// - show search results
// - kick off API requests


final class RMSearchViewViewModel {
    
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config) {
        self.config = config
    }
}
