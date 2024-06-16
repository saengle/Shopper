//
//  ApiManager.swift
//  Shopper
//
//  Created by 쌩 on 6/16/24.
//

import UIKit

import Alamofire

class ApiManager {
    
    
    func callShoppingRequest(query: String, sort: String) {
        
        let parameters: Parameters = ["query": query,
                                       "display": "30",
                                       "start": "1",
                                       "sort": sort]
        
        AF.request(SecureAPI.naverShoppingApiUrl, parameters: parameters, headers: SecureAPI.naverApiHeader).responseString{ response in
            print(response)
        }
        
        //        AF.request(url).responseDecodable(of: [Market].self) { response in
        //            switch response.result {
        //            case .success(let value):
        //                print("success")
        //                self.myMarket = value
        //                self.tableVIew.reloadData()
        //            case .failure(let error):
        //                print(error, "응답이 실패했습니다.")
        //            }
        //        }
        
    }
}
