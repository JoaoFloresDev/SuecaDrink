//
//  ViewController.swift
//  Sueca
//
//  Created by Joao Flores on 01/12/19.
//  Copyright © 2019 Joao Flores. All rights reserved.
//

import UIKit
import StoreKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    
    var bannerView: GADBannerView!
    var defaults = UserDefaults.standard
    
    var lastValue = 100
    var ratingShow = false
    var vetCardsImgName: [String] = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    var vetTitleText: [String] =
        [
            // A
            "Um bebe",
            
            //2
            "Dois bebem",
            
            //3
            "Três bebem",
            
            //4
            "Saída",
            
            //5
            "Eu nunca",
            
            //6
            "Continência",
            
            //7
            "PI",
            
            //8
            "Palavra não dita",
            
            //9
            "C ou S",
            
            //10
            "Crie uma regra",
            
            //J
            "Homens bebem",
            
            //Q
            "Mulheres bebem",
            
            //K
            "Todos bebem"
    ]
    
    var vetDescriptionText: [String] =
        [
            // A
            "Escolha um jogador para beber.",
            
            //2
            "Escolha dois jogadores para beber.",
            
            //3
            "Escolha três jogadores para beber.",
            
            //4
            "Permite ao jogador uma ida ao banheiro. Essa carta também pode ser guardada e negociada.",
            
            //5
            "A brincadeira consiste em alguém levantar uma negação, todos aqueles que já tiverem feito tal ação, bebem.",
            
            //6
            "Guarde esta carta e use-a quando quiser. Em qualquer momento do jogo, você pode colocar a mão na testa, discretamente, fazendo continência. O último que perceber e fizer continência, bebe.",
            
            //7
            "Inicie uma contagem crescente iniciada em 1, múltiplos de 3 e que tenham 3 são substituídos por PI, quem errar bebe. Ex.: 1, 2, PI, 4, 5, PI, 7, 8, PI, 10, 11, PI, PI, 14.",
            
            //8
            "Escolha uma palavra que não pode ser dita. Quem falar bebe.",
            
            //9
            "São proibidas palavras iniciadas com C ou S. Diga uma palavra, o próximo jogador deve dizer outra do mesmo tema, seguindo até que alguém errar.",
            
            //10
            "Determine uma regra para todos obedecerem. Pode ser algo do tipo “está proíbido falar a palavra ‘beber’”, ou “antes de beber uma dose, a pessoa tem que rebolar”. Quem quebrar a regra, deve beber.",
            
            //J
            "Todos os homens no jogo bebem.",
            
            //Q
            "Todas as mulheres no jogo bebem.",
            
            //K
            "Todos os jogadores bebem."
    ]
    
//    MARK: - IBOutlet
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var amazonMktView: UIView!
    
//    MARK: - IBOutlet
    @IBAction func newCardAction(_ sender: Any) {
        var newCard = Int.random(in: 0 ..< vetCardsImgName.count)
        
        while newCard == lastValue {
            newCard = Int.random(in: 0 ..< vetCardsImgName.count)
        }
        
        lastValue = newCard
        
        self.cardImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7 )
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.cardImg.image = UIImage(named:
                NSLocalizedString(self.vetCardsImgName[newCard], comment: ""))
            
            self.cardImg.transform = .identity
        }, completion: nil)
        
        cardImg.image = UIImage(named: vetCardsImgName[newCard])
        titleText.text = vetTitleText[newCard]
        descriptionText.text = vetDescriptionText[newCard]
    }
    @IBAction func amazonMkt(_ sender: Any) {
        let urlStr = "https://amzn.to/2KQPauf"
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: urlStr)!, options: [:], completionHandler: nil)
            
        } else {
            UIApplication.shared.openURL(URL(string: urlStr)!)
        }
    }
    
//    MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(defaults.bool(forKey: "Purchased")) {
            amazonMktView.removeFromSuperview()
        }
        else {
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["bc9b21ec199465e69782ace1e97f5b79"]

            bannerView = GADBannerView(adSize: kGADAdSizeBanner)
            addBannerViewToView(bannerView)
            bannerView.adUnitID = "ca-app-pub-8858389345934911/5780022981"
            bannerView.rootViewController = self

            bannerView.load(GADRequest())
            bannerView.delegate = self
        }
    }
    
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
    
    func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
    //    MARK: - RATE APP
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
