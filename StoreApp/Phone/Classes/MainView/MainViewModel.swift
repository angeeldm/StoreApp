//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Angel on 30/07/2022.
//

import Foundation

class MainViewModel {
    private let model = MainModel()
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest = { () -> Void in }
    var bindErrorHandler = { (_ message: String) -> Void in }
    var bindRefreshData = { (_ productsList: [Product]) -> () in }
    
    var productsResult: [Product] = [] {
        didSet { self.bindRefreshData(productsResult) }
    }
    
    func toGetProducts() {
        bindInitRequest()
        model.getProducts { [self] productsArray in
            if !productsArray.isEmpty {
                productsResult = productsArray
                bindEndRequest()
            } else {
                bindErrorHandler("Por los momentos no se encontraron productos, intenta nuevamente")
                bindEndRequest()
            }
        } onFailure: { errorMessage in
            self.bindErrorHandler(errorMessage)
        }

    }
}
