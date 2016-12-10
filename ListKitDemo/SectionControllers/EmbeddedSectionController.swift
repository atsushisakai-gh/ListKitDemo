//
//  EmbeddedSectionController.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import UIKit
import IGListKit

final class EmbeddedSectionController: IGListSectionController, IGListSectionType {
    
    var user: User?
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 75, height: 90)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(withNibName: "UserCell", bundle: nil, for: self, at: index) as! UserCell
        cell.nicknameLabel.text = user?.nickname[0...1]
        return cell
    }
    
    func didUpdate(to object: Any) {
        user = object as? User
    }
    
    func didSelectItem(at index: Int) {}
    
}

// @see: http://stackoverflow.com/a/39612638
extension String {
    subscript (r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex =  self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex...endIndex]
        }
    }
}
