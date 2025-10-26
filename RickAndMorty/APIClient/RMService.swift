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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    //Send Rick and Morty API Call
    //-Parameters:
        //-request: Request instance
        //-type: The type of object we expect to get back
        //-completion: Callback with data or error
    public func execute<T: Codable>(
            _ request: RMRequest,
            expecting type: T.Type,
            completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let urlRequest = self.requestURL(for: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        print(request.url?.absoluteString ?? "No URL")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            //Decode response
            //WORKING UP UNTIL 1:27:20 TIMESTAMP btw
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
                //print(String(describing: json))
            }
            catch {
                completion(.failure(error))
            }
            
        }
        
        task.resume()
        
    }
    
    //Mark: - Private
    
    private func requestURL(for rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
    
}
