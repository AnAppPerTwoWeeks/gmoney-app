//
//  StoreModel.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import Foundation

class StoreModel: NSObject {
    @objc dynamic var stores = [Store]()
    
    var searchedStores = [Store]()
    
    var count: Int {
        searchedStores.count
    }
    
    func setSearchedStores() {
        searchedStores = stores
    }
    
    func filterStores(_ searchText: String) {
        searchedStores = stores.filter({ (store: Store) -> Bool in
            store.name.lowercased().contains(searchText.lowercased())
        })
    }
    
    func update(_ city: String) {
        NetworkController.fetchStores(city) { (stores) in
            if let list = stores {
                self.stores.append(contentsOf: list)
            }
        }
    }
    
    func getStoreByIndex(_ at: Int) -> Store {
        return searchedStores[at]
    }
}
