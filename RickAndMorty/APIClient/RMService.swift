//
//  RMService.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 9/20/25.
//

import Foundation

//PRIMARY API SERVICE OBJECT TO GET RICK AND MORTY DATA
final class RMService {
    
    //Shared Singleton you can access from anywhere in the entire app
    static let shared = RMService()
    
    //Privatized constructor
    private init() {}
    
    //Send Rick and Morty API Call
    //-Parameters:
        //-request: Request instance
        //-type: The type of object we expect to get back
        //-completion: Callback with data or error
    public func execute<T: Codable>(
            _ request: RMRequest,
            expecting type: T.Type,
            completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
