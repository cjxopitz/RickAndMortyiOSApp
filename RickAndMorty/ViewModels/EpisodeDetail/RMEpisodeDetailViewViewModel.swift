//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 11/17/25.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    
    private let endpointUrl: URL?
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel])
        case characters(viewModel: [RMCharacterCollectionViewCellViewModel])
        
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    public private(set) var sections: [SectionType] = []
    

    
    //MARK: - Init
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
    }
    
    //MARK: - Public
    
    //MARK: - Private
    
    ///Fetch backing Episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
                let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                //print(String(describing: success))
                self?.fetchRelatedCharacters(episode: model)
            case .failure(_):
                break
            }
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let requests = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
          return RMRequest(url: $0)
        })
        
        // 10 of parallel requests, notified once all done
        // Send out all requests at the same time
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) { result in
                defer {
                    group.leave()
                }
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure:
                    break
                }
            }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (
                episode,
                characters
            )
        }
        
    }

}
