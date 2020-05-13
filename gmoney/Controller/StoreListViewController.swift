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
    
    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(city)
        setupUI()
    }
    
    func setupUI() {
        cityName.text = city
        availableStoreLabel.text = "결제 가능매장"
        changeCityButton.setTitle("지역변경", for: .normal)
    }
    
    @IBAction func changeCity(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension StoreListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
