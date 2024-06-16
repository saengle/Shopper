//
//  ApiManager.swift
//  Shopper
//
//  Created by 쌩 on 6/16/24.
//

import UIKit

import Alamofire

class ApiManager {
    
    
    func callShoppingRequest(query: String, sort: String, completion: @escaping((Result<Shop, AFError>) -> Void))  {
        
        let parameters: Parameters = ["query": query,
                                      "display": "30",
                                      "start": "1",
                                      "sort": sort]
        
        AF.request(SecureAPI.naverShoppingApiUrl, parameters: parameters, headers: SecureAPI.naverApiHeader).responseDecodable(of: Shop.self) { response in
            switch response.result {
            case .success(let repositories):
                completion(.success(repositories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
