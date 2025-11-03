//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 10/18/25.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    enum SectionType: CaseIterable {
        case photo
        case information
        case episodes
    }
    
    public let sections = SectionType.allCases
    
    //MARK: - Init
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    private var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
   
    /// We're actually already grabbing the character, apparently?  Explanation at 4:22:00-4:23:00
//    public func fetchCharacterData() {
//        print(character.url)
//        guard let url = requestUrl,
//              let request = RMRequest(url: url) else {
//            print("Failed to create")
//            return
//        }
//        //print(request.url)
//        RMService.shared.execute(request,
//                                 expecting: RMCharacter.self) { result in
//            switch result {
//            case .success(let success):
//                print(String(describing: success))
//            case .failure(let failure):
//                print(String(describing: failure))
//            }
//        }
//        
//    }
    
}
