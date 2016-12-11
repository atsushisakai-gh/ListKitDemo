//
//  ViewController.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/08.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var data = SampleData.createInitialDataSet()

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

    @IBAction func updateData(_ sender: AnyObject) {
        self.data.insert(SampleData.createRandomFeed(), at: 1)
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension ViewController: IGListAdapterDataSource {
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return data as! [IGListDiffable]
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        if object is UserHistory {
            return UserHistorySectionController()
        } else if object is RecommendFeed {
            return RecommendFeedSectionController()
        } else {
            return FeedSectionController()
        }
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}
