//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/15/25.
//

import Foundation
import UIKit

struct RMSettingsCellViewModel: Identifiable, Hashable {
    
    var id = UUID()
    
    private let type: RMSettingsOption
    
    // MARK: - Init
    
    init(type: RMSettingsOption) {
        self.type = type
    }
    
    // MARK: - Public
    
    public var image: UIImage? {
        return type.iconImage
    }
    public var title: String {
        return type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }

}
