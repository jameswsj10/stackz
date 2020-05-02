//
//  KolodaCollectionVC.swift
//  stackz
//
//  Created by James Jung on 5/1/20.
//  Copyright © 2020 James Jung. All rights reserved.
//

import Foundation
import Koloda
import UIKit

extension FeedVC: KolodaViewDelegate, KolodaViewDataSource {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }

//    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
//
//    }

    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .fast
    }

    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return post_stacks[index]
    }

    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return post_stacks.count
    }


}
