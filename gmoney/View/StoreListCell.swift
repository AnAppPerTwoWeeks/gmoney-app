//
//  StoreListCell.swift
//  gmoney
//
//  Created by 장창순 on 13/05/2020.
//  Copyright © 2020 AnAppPerTwoWeeks.DiaryApp. All rights reserved.
//

import UIKit

class StoreListCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var address: UILabel!
    private var kvoToken: NSKeyValueObservation?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func update(_ store: Store) {
        kvoToken = store.observe(\.name, options: .initial) { (store, change) in
            self.name.text = store.name
            self.type.text = store.type
            self.address.text = store.address
        }
        
    }
    
}
