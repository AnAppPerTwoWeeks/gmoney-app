//
//  StoreListViewController.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import UIKit

class StoreListViewController: UIViewController {
    
    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var changeCityButton: UIButton!
    @IBOutlet weak var availableStoreLabel: UILabel!
    private var storesObserverList = [NSKeyValueObservation]()
    private var storeModel = StoreModel()
    var city = ""
    
    private var isSearchBarEmpty: Bool {
        searchBar.text?.isEmpty ?? true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        cityName.text = city
        availableStoreLabel.text = "결제 가능매장"
        searchBar.placeholder = "매장명으로 검색"
        changeCityButton.setTitle("지역변경", for: .normal)
        storeModel.update(city)
        updateTableView()
    }
    
    private func updateTableView() {
        let storesObserver = storeModel.observe(\.stores, options: .new, changeHandler: { (store, change) in
            DispatchQueue.main.async {
                self.storeTableView.reloadData()
            }
        })
        
        let filteredStoresObserver = storeModel.observe(\.filteredStores, options: .new, changeHandler: { (store, change) in
            DispatchQueue.main.async {
                self.storeTableView.reloadData()
            }
        })
        
        storesObserverList.append(storesObserver)
        storesObserverList.append(filteredStoresObserver)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let storeItem = segue.destination as? StoreDetailViewController {
            if let index = sender as? Int {
                storeItem.store = storeModel.getStoreByIndex(index, isSearchBarEmpty)
            }
        }
    }
    
    @IBAction func changeCity(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit {
        storesObserverList.removeAll()
    }
    
}

extension StoreListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return storeModel.countStores(isSearchBarEmpty)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreListCell", for: indexPath) as? StoreListCell else { return StoreListCell() }
        cell.update(storeModel.getStoreByIndex(indexPath.row, isSearchBarEmpty))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "StoreDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension StoreListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            storeModel.setFilteredStores()
        } else {
            storeModel.filterStores(searchText)
        }
        
    }
    
}
