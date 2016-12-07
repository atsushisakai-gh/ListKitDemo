//
//  UserHistorySectionController.swift
//  ListKitDemo
//
//  Created by 酒井篤 on 2016/12/10.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation
import IGListKit

final class UserHistorySectionController: IGListSectionController, IGListSectionType {
    
    var userHistory: UserHistory?
    
    lazy var adapter: IGListAdapter = {
        let adapter = IGListAdapter(
            updater: IGListAdapterUpdater(), viewController: self.viewController, workingRangeSize: 0
        )
        adapter.dataSource = self
        return adapter
    }()
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 90)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        adapter.collectionView = cell.collectionView
        return cell
    }

    
    func didUpdate(to object: Any) {
        self.userHistory = object as? UserHistory
    }
    
    func didSelectItem(at index: Int) {}
}

extension UserHistorySectionController: IGListAdapterDataSource {
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return (userHistory?.users)!
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return EmbeddedSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
}
