//
//  CityList.swift
//  gmoney
//
//  Created by 장창순 on 29/04/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import Foundation


struct CityList {
    static let citites = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"]

    static var count: Int {
        citites.count
    }
    
    static func getCityByIndex(_ at: Int) -> String {
        return citites[at]
    }
}
