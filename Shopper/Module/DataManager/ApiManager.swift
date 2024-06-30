//
//  ApiManager.swift
//  Shopper
//
//  Created by 쌩 on 6/16/24.
//

import UIKit

import Alamofire

class ApiManager {
    
    
    func callShoppingRequest<T: Decodable>(query: String, sort: String, start: Int, type: T.Type = T.self, completion: @escaping((Result<T, AFError>) -> Void))  {
        
        let parameters: Parameters = ["query": query,
                                      "display": "30",
                                      "start": start,
                                      "sort": sort]
        
        AF.request(SecureAPI.naverShoppingApiUrl, parameters: parameters, headers: SecureAPI.naverApiHeader).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let repositories):
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func callRequest<T:Decodable>(query: String, sort: String, start: Int, type: T.Type = T.self, completion: @escaping(T?, NetworkError?) -> Void) {
        guard let url = URL(string: SecureAPI.naverShoppingApiUrl) else { return }
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }
        var component = components
        
        component.queryItems = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "sort", value: sort),
            URLQueryItem(name: "start", value: "\(start)")
        ]
        guard let myUrl = component.url else { return }
        var request = URLRequest(url: myUrl, timeoutInterval: 3)
        request.headers = SecureAPI.naverApiHeader
        URLSession.shared.dataTask(with: request) { data, response, error in
           
            DispatchQueue.main.async {
                guard let data else {
                    print("No Data Returned")
                    completion(nil, .noData)
                    return
                }
                guard error == nil else {
                    print("Failed Request")
                    completion(nil, .failedRequest)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    print("Unable Response")
                    completion(nil, .invalidResponse)
                    return
                }
                guard response.statusCode == 200 else {
                    print("Failed Response")
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, nil)
                } catch {
                    print("Error")
                    print(error)
                    completion(nil, .invalidData)
                }
            }
        }.resume()
    }
}
enum NetworkError: Int, Error {
    case failedRequest = 401
    case noData = 403
    case invalidResponse = 400
    case invalidData = 404
}
