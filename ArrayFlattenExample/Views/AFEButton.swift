//
//  AFEButton.swift
//  ArrayFlattenExample
//
//  Created by Brandon Askea on 2/7/19.
//  Copyright © 2019 Brandon Askea. All rights reserved.
//

import UIKit

class AFEButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: (35.0/255.0), green: (55.0/255.0), blue: (125.0/255.0), alpha: 1)
        layer.cornerRadius = 6
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.75
        layer.shadowOffset = CGSize(width: 1, height: 0)
        setTitleColor(.white, for: .normal)
    }

}
