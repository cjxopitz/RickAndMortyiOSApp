//
//  RMSettingsCellViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/15/25.
//

import Foundation
import UIKit

struct RMSettingsCellViewModel: Identifiable {
    
    var id = UUID()
    
    public let type: RMSettingsOption
    public let onTapHandler: (RMSettingsOption) -> Void
    
    // MARK: - Init
    
    init(type: RMSettingsOption, onTapHandler: @escaping (RMSettingsOption) -> Void) {
        self.type = type
        self.onTapHandler = onTapHandler
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
