import UIKit
import SnapKit
//import ZLSwipeableViewSwift
import UIColor_FlatColors
import Cartography

class HomeViewController: ZLSwipeableViewController {
    let rightBarButtonItemTitle = "Rewind"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeableView.numberOfHistoryItem = UInt.max
        swipeableView.allowedDirection = Direction.All
        
        swipeableView.didSwipe = {view, direction, vector in
            self.updateRightBarButtonItem()
        }
        
        // ↺
        let rightButton = UIBarButtonItem(title: rightBarButtonItemTitle, style: .plain, target: self, action: #selector(rightButtonClicked))
        navigationItem.rightBarButtonItem = rightButton
        
        updateRightBarButtonItem()
    }
    
    func updateRightBarButtonItem() {
        let historyLength = self.swipeableView.history.count
        let enabled = historyLength != 0
        self.navigationItem.rightBarButtonItem?.isEnabled = enabled
        if !enabled {
            self.navigationItem.rightBarButtonItem?.title = rightBarButtonItemTitle
            return
        }
        let suffix = " (\(historyLength))"
        self.navigationItem.rightBarButtonItem?.title = "\(rightBarButtonItemTitle)\(suffix)"
    }
    
    @objc func rightButtonClicked() {
        self.swipeableView.rewind()
        updateRightBarButtonItem()
    }
}
