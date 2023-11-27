//
//  ViewController.swift
//  Sueca
//
//  Created by Joao Flores on 01/12/19.
//  Copyright © 2019 Joao Flores. All rights reserved.
//

import UIKit
import GoogleMobileAds

var vetCardsImgName: [String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
var vetTitleText: [String] =
    [
        // A
        "1_title".localized(),
        //
        //2
        "2_title".localized(),

        //3
        "3_title".localized(),

        //            4
        "4_title".localized(),

        //5
        "5_title".localized(),

        //6
        "6_title".localized(),

        //7
        "7_title".localized(),

        //8
        "8_title".localized(),

        //9
        "9_title".localized(),

        //10
        "10_title".localized(),

        //J
        "11_title".localized(),

        //Q
        "12_title".localized(),

        //K
        "13_title".localized(),
    ]

var vetDescriptionText: [String] =
    [
        // A
        "1_description".localized(),
        //
        //2
        "2_description".localized(),

        //3
        "3_description".localized(),

        //            4
        "4_description".localized(),

        //5
        "5_description".localized(),

        //6
        "6_description".localized(),

        //7
        "7_description".localized(),

        //8
        "8_description".localized(),

        //9
        "9_description".localized(),

        //10
        "10_description".localized(),

        //J
        "11_description".localized(),

        //Q
        "12_description".localized(),

        //K
        "13_description".localized(),
    ]

class ViewController: UIViewController, GADBannerViewDelegate, PurchaseViewControllerDelegate {
    func purchased() {
        viewDescriptionConstraint.constant = 240
        textBottomConstraint.constant = 30
        bannerView.removeFromSuperview()
    }
    
    
    //    MARK: - Variables
    var bannerView: GADBannerView!
    
    var lastValue = 100
    var ratingShow = false
    
    //    MARK: - IBOutlet
    @IBOutlet weak var textBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewDescriptionConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var cardImg: UIImageView!
    
    @IBOutlet weak var mktPlaceholder: UIImageView!
    @IBOutlet weak var viewDescription: UIView!
    //    MARK: - IBAction
    @IBAction func newCardAction(_ sender: Any) {
        var newCard = Int.random(in: 0 ..< vetCardsImgName.count)
        
        while newCard == lastValue {
            newCard = Int.random(in: 0 ..< vetCardsImgName.count)
        }
        
        lastValue = newCard
        
        self.cardImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7 )
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.cardImg.image = UIImage(named: vetCardsImgName[newCard])
            
            self.cardImg.transform = .identity
        }, completion: nil)
        
        cardImg.image = UIImage(named: vetCardsImgName[newCard])
        titleText.text = vetTitleText[newCard]
        descriptionText.text = vetDescriptionText[newCard]
        
    }
    
    @IBAction func showHome(_ sender: Any) {
        showMenu()
    }
    
    
    //    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionText.text = "welcomeMessage".localized()
        titleText.text = "welcomeTitle".localized()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bannerView = GADBannerView(adSize: kGADAdSizeLargeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-8858389345934911/5780022981"
        bannerView.rootViewController = self

        bannerView.load(GADRequest())
        bannerView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: "Purchase",bundle: nil)
        let purchaseVC = storyboard.instantiateViewController(withIdentifier: "Purchase")
        if let purchaseVC = purchaseVC as? PurchaseViewController {
            purchaseVC.delegate = self
        }
        self.present(purchaseVC, animated: true)
    }
    
    //    MARK: - Functions
    func showMenu() {
        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let GoOrdemDasCartas = UIAlertAction(title: "Regras", style: .default, handler: { (action) -> Void in
            self.performSegue(withIdentifier: "segueCards", sender: nil)
        })
        
        let EditAction = UIAlertAction(title: "Drinks", style: .default, handler: { (action) -> Void in
            self.performSegue(withIdentifier: "segueDrinks", sender: nil)
        })
        
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
        
        optionMenu.addAction(GoOrdemDasCartas)
        optionMenu.addAction(EditAction)
        optionMenu.addAction(cancelAction)
        
        optionMenu.modalPresentationStyle = .popover
        optionMenu.popoverPresentationController?.sourceView = self.view
        optionMenu.popoverPresentationController?.sourceRect = CGRect(x: self.view.bounds.size.width / 2.0, y: self.view.bounds.size.height / 1.2, width: 1.0, height: 1.0)
        
        self.present(optionMenu, animated: true, completion: nil)
    }
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    //    MARK: - STYLE
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    //    MARK: - ADS
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
                didFailToReceiveAdWithError error: GADRequestError) {
        print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
        print("adViewWillLeaveApplication")
    }
}
