//
//  RMCharacterDetailsViewController.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 10/18/25.
//

import UIKit

// Controller to show info about single character
final class RMCharacterDetailsViewController: UIViewController {
    private let viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil,
                   bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsuppoted")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title

    }
}
