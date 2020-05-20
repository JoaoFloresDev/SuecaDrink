//
//  CreditsViewController.swift
//  Sueca
//
//  Created by Joao Flores on 12/12/19.
//  Copyright © 2019 Joao Flores. All rights reserved.
//

import UIKit
import StoreKit

class DrinksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeView(_ sender: Any) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
        rateApp()
    }
        
        func rateApp() {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
            }
        }
        
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
