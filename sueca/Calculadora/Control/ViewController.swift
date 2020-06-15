//
//  ViewController.swift
//  Sueca
//
//  Created by Joao Flores on 01/12/19.
//  Copyright © 2019 Joao Flores. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {
    
//    MARK: - Variables
    var bannerView: GADBannerView!
    
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
            "A brincadeira consiste em alguém levantar uma negação, todos aqueles que já tiverem feito, bebem.",
            
            //6
            "Em qualquer momento do jogo, você pode colocar a mão na testa, fazendo continência. O último que perceber e fizer continência, bebe.",
            
            //7
            "Inicie uma contagem crescente iniciada em 1, múltiplos de 3 e que tenham 3 são substituídos por PI, quem errar bebe. Ex: 1, 2, PI, 4, 5, PI, 7, 8, PI.",
            
            //8
            "Escolha uma palavra que não pode ser dita. Quem falar bebe.",
            
            //9
            "São proibidas palavras iniciadas com C ou S. Diga uma palavra, o próximo jogador deve dizer outra do mesmo tema, seguindo até que alguém errar.",
            
            //10
            "Determine uma regra para todos obedecerem. Exemplo: “Só pode beber com a mão esquerda”. Quem quebrar a regra, bebe.",
            
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
    
//    MARK: - IBAction
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
    
    @IBAction func showHome(_ sender: Any) {
        showMenu()
    }
    
    
//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.adUnitID = "ca-app-pub-8858389345934911/5780022981"
        bannerView.rootViewController = self
        
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        print("- Dinheiro ---------------------")
        print(RazeFaceProducts.store.isProductPurchased("NoAdds"))
        print("----------------------")
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
