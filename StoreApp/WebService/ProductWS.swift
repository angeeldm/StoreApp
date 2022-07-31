//
//  ProductWS.swift
//  StoreApp
//
//  Created by Angel on 29/07/2022.
//

import Foundation
import Alamofire

class ProductWS {
    func getProducts(onSuccess: @escaping ProductsResponseHandler, onFailure: @escaping ErrorHandler) {
        let url = URLApplications.Store.getStoreArray()
        let request = AF.request(url).validate()
        
        request.responseDecodable(of: [ProductDTO].self) { response in
            switch response.result {
            case .success(let data):
                onSuccess(data)
            case.failure(let error):
                onFailure(error.localizedDescription)
            }
        }
    }
}
