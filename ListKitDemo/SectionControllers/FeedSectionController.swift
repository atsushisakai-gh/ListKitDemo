//
//  FeedSectionController.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation
import IGListKit

final class FeedSectionController: IGListSectionController, IGListSectionType {
    
    var feed: Feed?
    
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
        let cell = collectionContext?.dequeueReusableCell(withNibName: "FeedCell", bundle: nil, for: self, at: index) as! FeedCell
        cell.commentLabel?.text = "\(feed.user.nickname)さんが「\(feed.comment)」とコメントしました。"
        cell.imageView?.image = feed.image
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.feed = object as? Feed
    }
    
    func didSelectItem(at index: Int) {}
}
