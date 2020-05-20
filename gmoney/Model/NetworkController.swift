//
//  NetworkController.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import Foundation

class NetworkController {
    
    static func fetchStores(_ selectedCity: String, onCompletion: @escaping ([Store]?) -> ()) {
        
        let storeURL = "https://openapi.gg.go.kr/RegionMnyFacltStus?KEY=da478b715bb94a06b244ac200f927f3c&Type=json&pIndex=1&pSize=1000&sigun_nm="
        
        let urlString = "\(storeURL)\(selectedCity)"
        
        if let encodedURL = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encodedURL) {
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    print("데이터를 받아오지 못했습니다.")
                    return
                }
                
                if error != nil {
                    print("에러가 있었습니다.")
                    return
                }
                do {
                    let container = try JSONDecoder().decode(List.self, from: data)
                    
                    onCompletion(container.getStoreList())
                    
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
        
    }
}

