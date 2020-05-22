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
    @objc dynamic var filteredStores = [Store]()
    private var isFiltering = false
    
    func setFilteredStores() {
        filteredStores = stores
    }
    
    func countStores(_ isFiltering: Bool) -> Int {
        if !isFiltering {
            return filteredStores.count
        } else {
            return stores.count
        }
    }
    
    func filterStores(_ searchText: String) {
        filteredStores = stores.filter({ (store: Store) -> Bool in
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
    
    func getStoreByIndex(_ at: Int,_ isFiltering: Bool) -> Store {
        if !isFiltering {
            return filteredStores[at]
        } else {
            return stores[at]
        }
    }
    
}
