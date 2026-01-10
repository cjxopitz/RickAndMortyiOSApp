//
//  RMSearchInputViewViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/28/25.
//

import Foundation

final class RMSearchInputViewViewModel {
    
    private let type: RMSearchViewController.Config.`Type`
    
    enum DynamicOption: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var queryArgument: String {
            switch self {
            case .status: return "status"
            case .gender: return "gender"
            case .locationType: return "type"
            }
        }
        
        var choices: [String] {
            switch self {
            case .status:
                return ["alive", "dead", "unknown"]
            case .gender:
                return ["female", "male", "genderless", "unknown"]
            case .locationType:
                return ["cluster", "planet", "microverse"]
            }
        }
    }
    
    init(type: RMSearchViewController.Config.`Type`) {
        self.type = type
    }
    
    // MARK: - Public
    
//case character // allow name | status | gender
//case episode // allow name searches only
//case location // allow name | type searches
    
    public var hasDynamicOptions: Bool {
        switch self.type {
        case .character:
            return true
        case .episode:
            return false
        case .location:
            return true
        }
    }
    
    public var options: [DynamicOption] {
        switch self.type {
        case .character:
            return [.status, .gender]
        case .episode:
            return []
        case .location:
            return [.locationType]
        }
    }
    
    public var searchPlaceholderText: String {
        switch self.type {
        case .character:
            return "Character Name"
        case .episode:
            return "Episode Name"
        case .location:
            return "Location Type"
        }
    }
    
}
