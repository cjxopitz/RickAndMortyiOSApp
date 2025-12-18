//
//  RMSettingsViewController.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 9/15/25.
//

import UIKit

final class RMSettingsViewController: UIViewController {
    
    private let viewModel = RMSettingsViewViewModel(
        cellViewModels: RMSettingsOption.allCases.compactMap({
            return RMSettingsCellViewModel(type: $0)
        })
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Settings"

        // Do any additional setup after loading the view.
    }

}
