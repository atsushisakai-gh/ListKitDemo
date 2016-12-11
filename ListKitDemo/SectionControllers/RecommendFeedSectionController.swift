//
//  RecommendFeedSectionController.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/11.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation
import IGListKit

final class RecommendFeedSectionController: IGListSectionController, IGListSectionType {
    
    var feed: RecommendFeed?
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 100)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let feed = feed else {
            fatalError("feed is nil.")
        }
        let cell = collectionContext?.dequeueReusableCell(withNibName: "RecommendFeedCell", bundle: nil, for: self, at: index) as! RecommendFeedCell
        cell.textLabel.text = feed.text
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.feed = object as? RecommendFeed
    }
    
    func didSelectItem(at index: Int) {}
}
