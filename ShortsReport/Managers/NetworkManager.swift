//
//  NetworkManager.swift
//  ShortsReport
//
//  Created by Aidan Pendlebury on 09/06/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import Foundation


/*
 
 https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&exclude=minutely&appid=012583e4f70d9bb3a88dccaba58090ca
 
 
 */


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    
    func fetchData(from urlString: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {

        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    completion(.success(data))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                    print(error!.localizedDescription)
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
    }
    
}


enum NetworkError: Error {
    case badURL, requestFailed, unknown
}
