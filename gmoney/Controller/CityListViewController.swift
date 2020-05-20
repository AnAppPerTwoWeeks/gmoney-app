//
//  CityListViewController.swift
//  gmoney
//
//  Created by 장창순 on 27/04/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var cityCollectionView: UICollectionView!
    @IBOutlet weak var selectCityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cityCollectionView.setContentOffset(.zero, animated: true)
    }
    
    private func setupLabel() {
        selectCityLabel.text = "지역을\n선택하세요"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let stores = segue.destination as? StoreListViewController {
            if let index = sender as? Int {
                stores.city = CityList.getCityByIndex(index)
            }
        }
    }
}

extension CityListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityNameCell", for: indexPath) as? CityNameCell else { return CityNameCell() }
        
        cell.cityName.text = CityList.getCityByIndex(indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "StoreList", sender: indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize: CGFloat!
        cellSize = (collectionView.frame.width / 3) - 15
        return CGSize(width: cellSize, height: cellSize)
    }
}

