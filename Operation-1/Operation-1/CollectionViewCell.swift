//
//  CollectionViewCell.swift
//  Operation-1
//
//  Created by ChandlerZou on 2018/10/8.
//  Copyright © 2018 zouhuanlin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func layoutSubviews() {
        imageView.contentMode = .scaleAspectFill
    }
}
