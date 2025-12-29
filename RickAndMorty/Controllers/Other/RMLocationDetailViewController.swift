//
//  RMLocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 12/27/25.
//

//10:30:00 - 10:31:00, Afraz delivers a pep talk you need to hear
//The first apps he built TEN YEARS AGO WERE SELF-PROCLAIMED TRASH
//You've been doing this for like 2 years and this isn't your fucking main job, be kind to yourself

import UIKit

class RMLocationDetailViewController: UIViewController, RMLocationDetailViewViewModelDelegate, RMLocationDetailViewDelegate {
    
    private let viewModel: RMLocationDetailViewViewModel
    
    private let detailView = RMLocationDetailView()
    
    //MARK: - Init
    
    init(location: RMLocation) {
        let url = URL(string: location.url)
        self.viewModel = RMLocationDetailViewViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
        //view.addSubview(detailView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailView)
        addConstraints()
        detailView.delegate = self
        title = "Location"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        
        viewModel.delegate = self
        viewModel.fetchLocationData()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func didTapShare() {
        
    }
    
    //MARK: - View Delegate
    func rmEpisodeDetailView(
        _ detailView: RMLocationDetailView,
        didSelect character: RMCharacter
    ) {
        let vc = RMCharacterDetailsViewController(viewModel: .init(character: character))
        vc.title = character.name
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: = ViewModel Delegate
    
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }

}
