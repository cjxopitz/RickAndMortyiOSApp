//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 11/3/25.
//

import Foundation
import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    
    private let type: `Type`
    private let value: String
    
    //"Creating as a static because initialzing date formatters is incredibly expense wrt performance overhead"
    //^THIS ONE SENTENCE ENCAPSULATES WHY YOU JUST NEED TO BUILD THE *MVP* AND THEN PUT TOGETHER A CREW
    //^KNOWING THAT IS WILDLY ESOTERIC AND HAS NO VALUE BEYOND CONNECTING ON THIS LONGSHOT MOONSHOT DREAM PROJECT
    static let dateFormatter: DateFormatter = {
        //Format
        //2017-11-04T18:48:46.250Z
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        //Format
        //2017-11-04T18:48:46.250Z
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    public var title: String {
        type.displayTitle
    }
    
    public var displayValue: String {
        
        //2025-11-10T07:21:07+0000
        //2017-11-04T18:48:46.250Z
        
        if value.isEmpty { return "None" }
        
//        if type == .created {
//            print("format: \(value)")
//        }
        
        if let date = Self.dateFormatter.date(from: value),
            type == .created {
            return Self.shortDateFormatter.string(from: date)
            //print("Result: "+String(describing: date))
        }
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor {
        return type.tintColor
    }
    
    enum `Type`: String {
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemRed
            case .gender:
                return .systemOrange
            case .type:
                return .systemYellow
            case .species:
                return .systemMint
            case .origin:
                return .systemGreen
            case .created:
                return .systemBlue
            case .location:
                return .systemCyan
            case .episodeCount:
                return .systemPurple
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
    
    var displayTitle: String {
        switch self {
        case .status,
            .gender,
            .type,
            .species,
            .origin,
            .created,
            .location:
            return rawValue.uppercased()
        case .episodeCount:
            return "Episode Count"
        }
    }
}
    
    init(
        type: `Type`,
        value: String
    ) {
        self.value = value
        self.type = type
    }
}
