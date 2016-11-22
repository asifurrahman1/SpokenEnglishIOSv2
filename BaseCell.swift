//
//  BaseCell.swift
//  Learning_App_test2
//
//  Created by Md Asifur Rahman on 9/10/16.
//  Copyright © 2016 Md Asifur Rahman. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}