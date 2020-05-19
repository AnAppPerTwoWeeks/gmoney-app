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
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var changeCityButton: UIButton!
    @IBOutlet weak var availableStoreLabel: UILabel!
    private var kvoToken: NSKeyValueObservation?
    private var storeManager = StoreModel()
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        cityName.text = city
        availableStoreLabel.text = "결제 가능매장"
        changeCityButton.setTitle("지역변경", for: .normal)
        storeManager.update(city)
        updateTableView()
        }

    private func updateTableView() {
        kvoToken = storeManager.observe(\.stores, options: .new, changeHandler: { (store, change) in
            DispatchQueue.main.async {
                self.storeTableView.reloadData()
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let storeItem = segue.destination as? StoreDetailViewController {
            if let index = sender as? Int {
                storeItem.store = storeManager.getStoreByIndex(index)
            }
        }
    }
    
    @IBAction func changeCity(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension StoreListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeManager.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreListCell", for: indexPath) as? StoreListCell else { return StoreListCell() }
        cell.update(storeManager.getStoreByIndex(indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "StoreDetail", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
