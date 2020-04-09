//
//  ViewController.swift
//  Sueca
//
//  Created by Joao Flores on 01/12/19.
//  Copyright © 2019 Joao Flores. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {
    
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
            "Stop",
            
            //6
            "Continência",
            
            //7
            "PI",
            
            //8
            "Palavra não dita",
            
            //9
            "Cafofo",
            
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
            "Escolha uma palavra qualquer, o próximo jogador deve repetir a palavra anterior e adicionar uma, e assim por diante. Exemplo: Quem tirou a carta diz “carro”. O próximo diz “carro casa”. O próximo diz “carro casa mesa”. Quem errar bebe.",
            
            //6
            "Guarde esta carta e use-a quando quiser. Em qualquer momento do jogo, você pode colocar a mão na testa, discretamente, fazendo continência. O último que perceber e fizer continência, bebe.",
            
            //7
            "Inicie uma contagem crescente iniciada em 1, múltiplos de 3 e que tenham 3 são substituídos por PI, quem errar bebe. Ex.: 1, 2, PI, 4, 5, PI, 7, 8, PI, 10, 11, PI, PI, 14.",
            
            //8
            "Escolha uma palavra que não pode ser dita. Quem falar bebe.",
            
            //9
            "Escolha um tema, como por exemplo “marcas de carros”. Diga uma palavra do tema, o proximo jogador deve dizer outra palavra do tema e assim por diante. O jogo acaba quando alguém não souber uma nova palavra do tema.",
            
            //10
            "Determine uma regra para todos obedecerem. Pode ser algo do tipo “está proíbido falar a palavra ‘beber’”, ou “antes de beber uma dose, a pessoa tem que rebolar”. Quem quebrar a regra, deve beber.",
            
            //J
            "Todos os homens no jogo bebem.",
            
            //Q
            "Todas as mulheres no jogo bebem.",
            
            //K
            "Todos os jogadores bebem."
    ]
    
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var cardImg: UIImageView!
    
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
        
        if(newCard == 1 && !UserDefaults.standard.bool(forKey: "NoFirsGame")) {
            UserDefaults.setValue(true, forKey: "NoFirsGame")
            rateApp()
        }
    }
    
//    @IBAction func menu(_ sender: Any) {
//
//        let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//        let GoOrdemDasCartas = UIAlertAction(title: "Regras", style: .default, handler: { (action) -> Void in
//            self.performSegue(withIdentifier: "roles", sender: nil)
//        })
//
//        let EditAction = UIAlertAction(title: "Editar regras", style: .default, handler: { (action) -> Void in
//            self.performSegue(withIdentifier: "editRoles", sender: nil)
//        })
//
//        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)
//
//        optionMenu.addAction(GoOrdemDasCartas)
//        optionMenu.addAction(EditAction)
//
//        optionMenu.addAction(cancelAction)
//
//        self.present(optionMenu, animated: true, completion: nil)
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func rateApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
        ratingShow = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

