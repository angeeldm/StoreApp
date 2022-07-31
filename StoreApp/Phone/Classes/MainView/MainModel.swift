//
//  MainModel.swift
//  StoreApp
//
//  Created by Angel on 29/07/2022.
//

import Foundation

struct MainModel {
    private let service = ProductWS()
    
    func getProducts(onSuccess: @escaping ProductsArray, onFailure: @escaping ErrorHandler) {
        service.getProducts { productsResponse in
            if !productsResponse.isEmpty {
                let productsList = productsResponse.map({ dto in Product(dto) })
                onSuccess(productsList)
            } else {
                onFailure("Por los momentos no se encontraron productos")
            }
        } onFailure: { errorMessage in
            onFailure(errorMessage)
        }

    }
}
