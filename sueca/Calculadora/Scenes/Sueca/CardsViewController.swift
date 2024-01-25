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
    @IBOutlet weak var proVersionView: ProView!
    @IBOutlet var titleCollection: [UILabel]!
    @IBOutlet var descriptionCollerction: [UILabel]!
    @IBOutlet weak var rolesLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    @IBAction func close(_ sender: Any) {
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
    
    @IBOutlet weak var buttonUpgrade: UIView!
    
    override func viewDidLoad() {
        buttonUpgrade.layer.cornerRadius = 10
        buttonUpgrade.clipsToBounds = true

        for (index, title) in titleCollection.enumerated() {
            title.text = vetTitleText[index]
        }

        for (index, description) in descriptionCollerction.enumerated() {
            description.text = vetDescriptionText[index]
        }
        
        rolesLabel.text = "roles".localized()
        closeButton.setTitle("close".localized(), for: .normal)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        proVersionView.addGestureRecognizer(tapGesture)
        proVersionView.isUserInteractionEnabled = true
    }
    
    @objc private func handleTap() {
        let storyboard = UIStoryboard(name: "Purchase",bundle: nil)
        let purchaseVC = storyboard.instantiateViewController(withIdentifier: "Purchase")
        self.present(purchaseVC, animated: true)
    }
}

class ProView: UIView {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Pro Version"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        backgroundColor = UIColor(
            red: 240 / 255.0,
            green: 182 / 255.0,
            blue: 0 / 255.0,
            alpha: 1.0
        )

        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        layer.cornerRadius = 10
        clipsToBounds = true
    }
}
