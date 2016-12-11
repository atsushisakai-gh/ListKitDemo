//
//  RecommendFeed.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/11.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation
import IGListKit

class RecommendFeed {
    let id: String
    let text: String
    
    init() {
        self.id = "recommend"
        self.text = "みてね使ってね!!"
    }
}

extension RecommendFeed: IGListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return "recommend" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? RecommendFeed else { return false }
        return id == object.id
    }
}
