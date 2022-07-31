//
//  URLApplications.swift
//  StoreApp
//
//  Created by Angel on 28/07/2022.
//

import Foundation

struct URLApplications {
    static private var baseURL: String { "https://private-f0eea-mobilegllatam.apiary-mock.com/list" }
    
    struct Store {
        static func getStoreArray() -> String { URLApplications.baseURL }
    }
}
