//
//  StoreModel.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import Foundation

class StoreModel {
    private var stores = [Store]()
    
    var count: Int {
        stores.count
    }
    
    func setStores(_ list: [Store]) {
        stores = list
    }
    
    func getStoreByIndex(_ at: Int) -> Store {
        return stores[at]
    }
}
