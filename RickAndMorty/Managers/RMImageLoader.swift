//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Charles Opitz on 10/25/25.
//

import Foundation

final class RMImageLoader {
    static let shared = RMImageLoader()
    
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private init() {}
    
    /// Get image content with URL
    ///  - Paramters:
    ///    - url: Souce url
    ///    - completion: Callback
    
    public func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let key = url.absoluteString as NSString
        if let data = imageDataCache.object(forKey: key) {
            print("We're reading from the cache now instead of reloading data! \(key) :D")
            completion(.success(data as Data))
            //NSData == Data | NSString == String, just an FYI, complexity between Swift & Objective C
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            let value = data as NSData
            self?.imageDataCache.setObject(value, forKey: key)
            completion(.success(data))
        }
        task.resume()
    }
}
