import Foundation
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Botão 1", for: .normal)
        button.backgroundColor = .blue // Cor de fundo
        button.setTitleColor(.white, for: .normal) // Cor do texto
        button.layer.cornerRadius = 10 // Borda arredondada
        button.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Botão 2", for: .normal)
        button.backgroundColor = .red // Cor de fundo
        button.setTitleColor(.white, for: .normal) // Cor do texto
        button.layer.cornerRadius = 10 // Borda arredondada
        button.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
        return button
    }()
    
    private let backgroundView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "wood edit")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(backgroundView)
        view.addSubview(button1)
        view.addSubview(button2)
        
        // Definindo o tamanho dos botões como quadrados e posicionando-os
        let buttonSize = 100 // Tamanho do lado do quadrado
        
        button1.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60) // Ajuste para posicionar corretamente
            make.width.height.equalTo(buttonSize) // Tamanho fixo para largura e altura
        }
        
        button2.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom).offset(40) // Espaçamento entre os botões
            make.centerX.equalTo(button1.snp.centerX)
            make.width.height.equalTo(buttonSize) // Tamanho fixo para largura e altura
        }
        
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
        }

        // Configura a cor dos itens da barra de navegação, incluindo a seta de voltar, para branco
        navigationController?.navigationBar.tintColor = UIColor.white

        // Torna a barra de navegação transparente e ajusta outras propriedades de aparência
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .clear // Cor de fundo transparente
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // Cor do título
            appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white] // Cor dos botões
            appearance.backgroundEffect = nil
            appearance.shadowColor = nil // Remove sombra/linha

            // Aplica a aparência configurada
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            navigationController?.navigationBar.isTranslucent = true
        } else {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.isTranslucent = true
        }

        // Oculta o texto do botão de voltar
        let backButton = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    @objc private func button1Action() {
        let historyViewController = HistoryDemoViewController()
        navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    @objc private func button2Action() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let meuViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(meuViewController, animated: true)
        }
    }
}
