//
//  Feed.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import UIKit
import IGListKit

class Feed {
    let id: String
    let user: User
    let comment: String
    let image: UIImage
    
    init(id: String, user: User, comment: String, image: UIImage) {
        self.id = id
        self.user = user
        self.comment = comment
        self.image = image
    }
}

extension Feed: IGListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if let feed = object as? Feed {
            return id == feed.id
        }
        return false
    }
}
