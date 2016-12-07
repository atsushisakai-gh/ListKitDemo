//
//  EmbeddedCollectionViewCell.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import UIKit
import IGListKit

class EmbeddedCollectionViewCell: UICollectionViewCell {
    
    lazy var collectionView: IGListCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = IGListCollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = true
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
        let bounds = contentView.bounds
        let height: CGFloat = 0.5
        let left = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15).left
        separator.frame = CGRect(x: left, y: bounds.height - height, width: bounds.width, height: height)
    }

    lazy var separator: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor(red: 200/255.0, green: 199/255.0, blue: 204/255.0, alpha: 1).cgColor
        self.contentView.layer.addSublayer(layer)
        return layer
    }()
    
}
