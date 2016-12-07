//
//  ViewController.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/08.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController, IGListAdapterDataSource {

    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    let radioboo     = User(id: 1, nickname: "radioboo")
    let ainame       = User(id: 2, nickname: "ainame")
    let punchdrunker = User(id: 3, nickname: "pubchdrunker")
    let sarukun      = User(id: 4, nickname: "sarukun")
    let sobataro     = User(id: 5, nickname: "sobataro")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    // MARK: DataSource Protocol
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        let data = [
            UserHistory(users: [radioboo, ainame, punchdrunker, sarukun, sobataro]),
            Feed(id: 1, user: radioboo, comment: "あったかいうどんたべたいなぁ", image: UIImage(named: "IMG_001.jpg")!),
            Feed(id: 2, user: ainame, comment: "昨日うどんたべた。今日もだべたい。", image: UIImage(named: "IMG_002.jpg")!),
            Feed(id: 3, user: punchdrunker, comment: "うどんたべすぎると糖尿病になるぞ!!!!!", image: UIImage(named: "IMG_003.jpg")!),
            Feed(id: 4, user: sarukun, comment: "またうどんか…", image: UIImage(named: "IMG_004.jpg")!),
            Feed(id: 5, user: sobataro, comment: "おっさんそば食えや", image: UIImage(named: "IMG_005.jpg")!),
            Feed(id: 6, user: radioboo, comment: "はい…", image: UIImage(named: "IMG_001.jpg")!),
        ] as [Any]
        return data as! [IGListDiffable]
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if object is UserHistory {
            return UserHistorySectionController()
        } else {
            return FeedSectionController()
        }
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}
