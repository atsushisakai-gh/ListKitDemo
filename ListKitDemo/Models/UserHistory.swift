//
//  UserHistory.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation
import IGListKit

class UserHistory {
    let identifier: String
    let users: [User]
    
    init(users: [User]) {
        self.identifier = "userHistory"
        self.users = users
    }
}

extension UserHistory: IGListDiffable {

    // @see: https://github.com/rnystrom/SimpleWeather/blob/master/SimpleWeather/Classes/Models/DailyForecastSection%2BIGListDiffable.swift
    func diffIdentifier() -> NSObjectProtocol {
        return "userHistory" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? UserHistory else { return false }
        return identifier == object.identifier
    }
}
