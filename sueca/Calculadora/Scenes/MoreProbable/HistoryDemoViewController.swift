//
//  UndoDemoViewController.swift
//  ZLSwipeableViewSwiftDemo
//
//  Created by Zhixuan Lai on 5/25/15.
//  Copyright (c) 2015 Zhixuan Lai. All rights reserved.
//

import UIKit

class HistoryDemoViewController: ZLSwipeableViewController {

    let rightBarButtonItemTitle = "↻"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeableView.numberOfHistoryItem = UInt.max
        swipeableView.allowedDirection = [.Left, .Right]

        // ↺
        let rightButton = UIBarButtonItem(title: rightBarButtonItemTitle, style: .plain, target: self, action: #selector(rightButtonClicked))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    // MARK: - Actions
    @objc func rightButtonClicked() {
        self.swipeableView.rewind()
    }

}
