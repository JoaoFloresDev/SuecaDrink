//
//  CardsViewController.swift
//  Calculadora
//
//  Created by Joao Flores on 31/10/19.
//  Copyright © 2019 Gustavo Lima. All rights reserved.
//

import UIKit
import StoreKit

class CardsViewController: UIViewController {
    
    var products: [SKProduct] = []
    
//    MARK: - IBOutlet
    @IBOutlet weak var label3: UILabel!
    
//    MARK: - IBAction
    @IBAction func close(_ sender: Any) {
        navigationController?.popViewController(animated: true)

        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func removeAdcButton(_ sender: Any) {
        reload()
    }
    
    @IBAction func trucoMKT(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id1486427751?mt=8&uo=4")! as URL)
    }
    
//    MARK: - IBAction
    @objc func reload() {
      products = []
      
      RazeFaceProducts.store.requestProducts{ [weak self] success, products in
        guard let self = self else { return }
        if success {
          self.products = products!
        let isProductPurchased = RazeFaceProducts.store.isProductPurchased(self.products[0].productIdentifier)
            if(!isProductPurchased) {
                RazeFaceProducts.store.buyProduct(self.products[0])
            } else {
                print("já adquirido")
            }
        }
      }
    }
}
