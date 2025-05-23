//
//  InterfaceNetwork.swift
//  GithubDataViewerIOS
//
//  Created by Jose Alberto Rosario Castillo on 16/5/25.
//

import Foundation

struct URLConstant {
    static let baseURLString = "https://api.github.com"
}

struct InterfaceNetwork {
    static func getRepository(for username: String, completion: @escaping (Result<[Repository], Error>) -> Void) {
        guard let url = URL(string: "\(URLConstant.baseURLString)/users/\(username)/repos") else {
            completion(.failure(NetworkError.internetConnectionError))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(NetworkError.internetConnectionError))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.internetConnectionError))
                return
            }

            do {
                let repos = try JSONDecoder().decode([Repository].self, from: data)
                completion(.success(repos))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


