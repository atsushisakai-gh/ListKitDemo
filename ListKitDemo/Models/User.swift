//
//  User.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/08.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation
import IGListKit

class User {
    let id: Int
    let nickname: String
    
    init(id: Int, nickname: String) {
        self.id = id
        self.nickname = nickname
    }
}

extension User: IGListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if let user = object as? User {
            return id == user.id
        }
        return false
    }
}
