//
//  CardsViewController.swift
//  Calculadora
//
//  Created by Joao Flores on 31/10/19.
//  Copyright © 2019 Gustavo Lima. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var label3: UILabel!
    
    @IBAction func close(_ sender: Any) {
        navigationController?.popViewController(animated: true)

        dismiss(animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func trucoMKT(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string: "itms://itunes.apple.com/de/app/x-gift/id1486427751?mt=8&uo=4")! as URL)
    }
}
