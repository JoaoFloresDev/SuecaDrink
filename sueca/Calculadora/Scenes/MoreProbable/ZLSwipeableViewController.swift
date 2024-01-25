import UIKit
import SnapKit
import ZLSwipeableViewSwift
import UIColor_FlatColors
import Cartography

class ZLSwipeableViewController: UIViewController {
    
    var swipeableView: ZLSwipeableView!
    
    var colors = ["Turquoise", "Green Sea", "Emerald", "Nephritis", "Peter River", "Belize Hole", "Amethyst", "Wisteria", "Wet Asphalt", "Midnight Blue", "Sun Flower", "Orange", "Carrot", "Pumpkin", "Alizarin", "Pomegranate", "Clouds", "Silver", "Concrete", "Asbestos"]
    
    let questions = [
        "Quem é mais provável que acabe na cadeia?",
        "Quem é mais provável comprar uma arma?",
        "Quem é mais provável beber até cair?",
        "Quem é mais provável de nunca se casar?",
        "Quem é mais provável de voltar com o ex?",
        "Quem é mais provável de se atrasar para o próprio casamento?",
        "Quem é mais provável de ficar com 10 pessoas em uma festa?",
        "Quem é mais provável de não ficar com ninguém em uma festa?",
        "Quem é mais provável de se casar primeiro?",
        "Quem é mais provável de perder uma briga?",
        "Quem é mais provável de cair em uma piada?",
        "Quem é mais provável de peidar em público?",
        "Quem é mais provável de fazer papel de bobo em público?",
        "Quem é mais provável de perder dinheiro na rua?",
        "Quem é mais provável de ter amnesia de tanto beber?",
        "Quem é mais provável de passar vergonha quando bebe?",
        "Quem é mais provável de chorar por besteira?",
        "Quem é mais provável de mentir para agradar alguém?",
        "Quem é mais provável de estragar um esquema romântico da amiga?",
        "Quem é mais provável de comer meio limão?",
        "Quem é mais provável ficar famoso?",
        "Quem é mais provável de comer uma pizza inteira?",
        "Quem é mais provável ficar velho mais rápido?",
        "Quem é mais provável ter todas a conta do Twitter tombada?",
        "Quem é mais provável de ficar rico um dia?",
        "Quem é mais provável sumir do mapa?",
        "Quem é mais provável de pobre o resto da vida?",
        "Quem é mais provável de ir para a academia?",
        "Quem é mais provável dormir em qualquer lugar?",
        "Quem é mais provável de fazer uma tatuagem horrível?",
        "Quem é mais provável fazer drama desnecessário?",
        "Quem é mais provável de praticar esportes radicais?",
        "Quem é mais provável de ter uma noite de bebidas com um estranho(A)?",
        "Quem é mais provável de nunca gastar suas economias?",
        "Quem é mais provável de rir na hora errada?",
        "Quem é mais provável de inventar uma história falsa?",
        "Quem é mais provável de ser um nerd?",
        "Quem é mais provável de esquecer o próprio aniversário?",
        "Quem é mais provável de chorar ao ver filmes tristes?",
        "Quem é mais provável escrever um livro?",
        "Quem é mais provável de brigar por uma amiga?",
        "Quem é mais provável dirigir bêbado?",
        "Quem é mais provável ter pego uma Dst?",
        "Quem é mais provável de se casar por dinheiro?",
        "Quem é mais provável de fazer perguntas idiotas?",
        "Quem é mais provável de roubar o namorado ou namorada de um amigo?",
        "Quem é mais provável de ficar tão bêbado de esquecer o próprio nome?",
        "Quem é mais provável de falhar na hora H?",
        "Quem é mais provável roubar em uma loja?",
        "Quem é mais provável de colocar fogo na cozinha enquanto faz comida?",
        "Quem é mais provável comprar 100 livros e não ler nenhum?",
        "Quem é mais provável cantar Justin Bieber no banho?",
        "Quem é mais provável de esquecer o filho no supermercado?",
        "Quem é mais provável de ganhar uma competição de quem bebe mais?",
        "Quem é mais provável de sumir e voltar como se nada tivesse acontecido?",
        "Quem é mais provável de arrumar briga porque perdeu no vídeo game?",
        "Quem é mais provável de cometer um crime?",
        "Quem é mais provável de aprender a tocar um instrumento sozinho?",
        "Quem é mais provável de ser a tia rica da família?",
        "Quem é mais provável de criar uma invenção que vai mudar o mundo?",
        "Quem é mais provável de colocar fogo na casa sem querer?",
        "Quem é mais provável de ser mais convincente quando esta mentindo?",
        "Quem é mais provável de sair para comprar uma coisa e voltar com outra totalmente diferente?",
        "Ir num encontro arranjado?",
        "Ir em um encontro usando pijamas?",
        "Virar dono de um bar?",
        "Comprar uma arma?",
        "Ter um carro de luxo?",
        "Desistir de vida na cidade e de mudar para uma fazenda?",
        "Ter um negócio ilegal?",
        "Se apaixonar pelo chefe?",
        "Se apaixonar por um professor?",
        "Tropeçar e cair em público?",
        "Ter pesadelos por causa de um filme de terror?",
        "Começar uma discussão?",
        "Descobrir que é um alien?",
        "Contar para uma criança que não existe Papai Noel?",
        "Chamar o(a) namorado(a) pelo nome errado?",
        "Comer batata frita com sorvete?",
        "Adotar um cachorro de rua?",
        "Desistir da faculdade no último ano?",
        "Se casar com alguém famoso?",
        "Se casar primeiro?",
        "Ganhar um prêmio Nobel?",
        "Falar algo embaraçoso na frente do(a) crush?",
        "Ganhar uma briga?",
        "Perder uma prova importante?",
        "Ter o coração partido?",
        "Partir o coração de alguém?",
        "Flertar com um professor?",
        "Esquecer o aniversário de alguém importante?",
        "Ser preso por fazer besteira",
        "Ficar famoso?",
        "Ter dois(as) namorados(a) ao mesmo tempo sem a outra pessoa saber?",
        "Se apaixonar perdidamente?",
        "Começar a fumar?",
        "Se apaixonar pelo(a) melhor amigo(a)?",
        "Virar humorista?",
        "Se demitir do emprego?",
        "Ter filhos?",
        "Se mudar de país sozinha?",
        "Se casar por interesse?",
        "Gastar dinheiro com besteira e se arrepender?",
        "Roubar algo pequeno de uma loja?",
        "Ultrapassar a velocidade máxima dirigindo?",
        "Entrar na casa errada bêbado?",
        "Fazer xixi na piscina?",
        "Mentir em uma entrevista de emprego?",
        "Ser expulso de uma balada?",
        "Esquecer as chaves de casa?",
        "Fazer um mochilão pelo país?",
        "Ficar com dor de barriga de tanto comer chocolate?",
        "Fazer uma tatuagem e se arrepender?"
    ]

    var colorIndex = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeableView.nextView = {
            return self.nextCardView()
        }
    }
    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
        print("Segmented control changed to index: \(sender.selectedSegmentIndex)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setToolbarHidden(false, animated: false)
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        
        let items = ["Todos", "Eu nunca", "Provável", "★"]
        let segmentedControl = UISegmentedControl(items: items)
        
        let height: CGFloat = 60
        segmentedControl.frame = CGRect(x: 0, y: 0, width: segmentedControl.frame.width, height: height)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)

        let segmentedControlBarItem = UIBarButtonItem(customView: segmentedControl)

        toolbarItems = [segmentedControlBarItem]
        navigationController?.isToolbarHidden = false
        
        swipeableView = ZLSwipeableView()
        view.addSubview(swipeableView)
        
        constrain(swipeableView, view) { view1, view2 in
            view1.left == view2.left+50
            view1.right == view2.right-50
            view1.top == view2.top + 120
            view1.bottom == view2.bottom - 100
        }
    }
    
    // MARK: ()
    func nextCardView() -> UIView? {
        if colorIndex >= colors.count {
            colorIndex = 0
        }
        
        let cardView = CardView(frame: swipeableView.bounds)
        cardView.backgroundColor = colorForName(colors[colorIndex])
        
        if Int.random(in: 0...10) > 0 {
            cardView.titleLabel.text = "Mais provável"
            let index = Int.random(in: 0..<questions.count)
            cardView.descriptionLabel.text = questions[index]
        } else {
            cardView.titleLabel.text = "Eu nunca"
            cardView.descriptionLabel.text = "Faça uma afirmação, todos que já tenham feito perdem"
        }
        
        
        
        
        
        
        
        colorIndex += 1
        return cardView
    }
    
    func colorForName(_ name: String) -> UIColor {
        let sanitizedName = name.replacingOccurrences(of: " ", with: "")
        let selector = "flat\(sanitizedName)Color"
        return UIColor.perform(Selector(selector)).takeUnretainedValue() as! UIColor
    }
}

