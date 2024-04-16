//
//  NetworkingManager.swift
//  UsersList
//
//  Created by Круглич Влад on 16.04.24.
//

import Foundation
import Alamofire

class NetworkingManager {
    static let shared = NetworkingManager(); private init() {}
    
    let URL = "https://jsonplaceholder.typicode.com/users"
    
    func fetchData(completion: @escaping(Result<[CodableType], Error>) -> ()) {
        AF.request(URL)
            .validate()
            .response {
                response in
                guard let data = response.data  else {
                    if let error = response.error {
                        completion(.failure(error))
                    }
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let decodedData = try decoder.decode([CodableType].self, from: data)
                    completion(.success(decodedData))
                }
                catch {
                    completion(.failure(NetworkingErrors.dataError))
                }
            }
    }
}

enum NetworkingErrors : Error {
    case dataError
}
