//
//  SampleData.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import UIKit

class SampleData {

    class func createInitialDataSet() -> [Any] {
        return [
            UserHistory(users: allUsers()),
            Feed(id: UUID().uuidString, user: allUsers()[0], comment: "はい…", image: UIImage(named: "IMG_005.jpg")!),
            Feed(id: UUID().uuidString, user: allUsers()[4], comment: "おっさんそば食えや", image: UIImage(named: "IMG_005.jpg")!),
            Feed(id: UUID().uuidString, user: allUsers()[3], comment: "またうどんか…", image: UIImage(named: "IMG_004.jpg")!),
            Feed(id: UUID().uuidString, user: allUsers()[2], comment: "うどんたべすぎると糖尿病になるぞ!!!!!", image: UIImage(named: "IMG_003.jpg")!),
            Feed(id: UUID().uuidString, user: allUsers()[1], comment: "昨日うどんたべた。今日もだべたい。", image: UIImage(named: "IMG_002.jpg")!),
            Feed(id: UUID().uuidString, user: allUsers()[0], comment: "あったかいうどんたべたいなぁ", image: UIImage(named: "IMG_001.jpg")!),
            ] as [Any]
    }
    
    class func createRandomFeed() -> Feed {
        return Feed(id: UUID().uuidString, user: randomUser(), comment: randomComment(), image: randomImage()!)
    }
    
    class func allUsers() -> [User] {
        let radioboo     = User(id: 1, nickname: "radioboo")
        let ainame       = User(id: 2, nickname: "ainame")
        let punchdrunker = User(id: 3, nickname: "punchdrunker")
        let sarukun      = User(id: 4, nickname: "sarukun")
        let sobataro     = User(id: 5, nickname: "sobataro")

        return [radioboo, ainame, punchdrunker, sarukun, sobataro]
    }

    class func randomUser() -> User {
        let index = Int((arc4random_uniform(UInt32(allUsers().count))))
        return allUsers()[index]
    }

    class func randomImage() -> UIImage? {
        let images = [
            UIImage(named: "IMG_001.jpg"),
            UIImage(named: "IMG_002.jpg"),
            UIImage(named: "IMG_003.jpg"),
            UIImage(named: "IMG_004.jpg"),
            UIImage(named: "IMG_005.jpg"),
        ]
        let index = Int((arc4random_uniform(UInt32(images.count))))
        return images[index]
    }

    class func randomComment() -> String {
        let strings = [
            "ズルズルっ!!!!!",
            "そばうまい…!!!",
            "小諸そばは梅干しが食えるので良い",
            "しぶそばは新そば使ってるらしいぞ!?!?",
        ]
        let index = Int((arc4random_uniform(UInt32(strings.count))))
        return strings[index]
    }

}
