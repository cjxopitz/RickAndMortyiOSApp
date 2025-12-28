//
//  RMlocationTableViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/25/25.
//

import Foundation
import UIKit

struct RMLocationTableViewCellViewModel: Hashable, Equatable {
    
    private var location: RMLocation
    
    
    //MARK: - Init
    
    init(location: RMLocation) {
        self.location = location
    }
    
    public var name: String {
        return location.name
    }
    
    public var type: String {
        return "Type: "+location.type
    }
    
    public var dimension: String {
        if location.dimension == "unknown" {
            return "Unknown dimension"
        }
        return location.dimension
    }
    
    static func == (lhs: RMLocationTableViewCellViewModel, rhs: RMLocationTableViewCellViewModel) -> Bool {
        return lhs.location.id == rhs.location.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(location.id)
        hasher.combine(dimension)
        hasher.combine(type)
    }
}
