//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 11/29/25.
//

import UIKit

// Dyanmic search option view

// Render results

// Render no results zero state

// Searching / API Call

final class RMSearchViewController: UIViewController {
    
    ///CONFIGURATION FOR SEARCH SESSION
    
    struct Config {
        enum `Type` {
            case character // allow name | status | gender
            case episode // allow name searches only
            case location // allow name | type searches
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .episode:
                    return "Search Episodes"
                case .location:
                    return "Search Locations"
                }
            }
        }
        let type: `Type`
    }
    
    private let config: Config
    
    // MARK: - Init
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = config.type.title
        view.backgroundColor = .systemBackground
    }
}
