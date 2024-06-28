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
    
}
