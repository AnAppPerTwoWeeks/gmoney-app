//
//  StoreData.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import Foundation

struct List: Codable {
    private let list: [Stores]
    
    private enum CodingKeys: String, CodingKey {
        case list = "RegionMnyFacltStus"
    }
    
    func getStoreList() -> [Store] {
        var stores = [Store]()
        if let list = list[1].stores {
            stores = list
        }
        return stores
    }
}

struct Stores: Codable {
    let stores: [Store]?
    
    private enum CodingKeys: String, CodingKey {
        case stores = "row"
    }
}

class Store: NSObject, Codable {
    @objc dynamic var name: String
    @objc dynamic var type: String?
    @objc dynamic var phoneNumber: String?
    @objc dynamic var submittedDate: String
    @objc dynamic var address: String?
    @objc dynamic var longitude: String?
    @objc dynamic var latitude: String?
    @objc dynamic var city: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "CMPNM_NM"
        case type = "INDUTYPE_NM"
        case phoneNumber = "TELNO"
        case submittedDate = "DATA_STD_DE"
        case address = "REFINE_ROADNM_ADDR"
        case longitude = "REFINE_WGS84_LOGT"
        case latitude = "REFINE_WGS84_LAT"
        case city = "SIGUN_NM"
    }
    
    func getName() -> String {
        return name
    }
    
    func getType() -> String {
        guard let str = type else {
            return "업종이 분류되어 있지 않습니다."
        }
        return str
    }
    
    func getAddress() -> String {
        guard let str = address else {
            return "주소가 등록되어 있지 않습니다."
        }
        return str
    }
    
    func getSubmittedDate() -> String {
        return submittedDate
    }
    
    func getPhoneNumber() -> String {
        guard let str = phoneNumber else {
            return "전화번호가 등록되어 있지 않습니다."
        }
        return str
    }
    
    func getLongitude() -> String {
        guard let str = longitude else {
            return "37.2410864"
        }
        return str
    }
    
    func getLatitude() -> String {
        guard let str = latitude else {
            return "127.1775537"
        }
        return str
    }
}
