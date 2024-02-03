import Foundation
import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sueca", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button1Action), for: .touchUpInside)
        return button
    }()

    private let button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Mais provável", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button2Action), for: .touchUpInside)
        return button
    }()

    private let button3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Versão premium", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(button3Action), for: .touchUpInside)
        return button
    }()
    
    private let backgroundView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "wood edit 1")
        return imageView
    }()
    
    private let backgroundView2: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.alpha = 0.1
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(backgroundView)
        view.addSubview(backgroundView2)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        let buttonSize = 68
        
        button1.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalTo(button2.snp.top).inset(-24)
            make.height.equalTo(buttonSize)
        }
        
        button2.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalTo(button3.snp.top).inset(-24)
            make.height.equalTo(buttonSize)
        }
        
        button3.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.height.equalTo(buttonSize)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundView2.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        navigationController?.navigationBar.tintColor = UIColor.white

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
        let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button1.applyGradient(colors: [UIColor.blue, UIColor.systemBlue], locations: [0.0, 1.0])
        button2.applyGradient(colors: [UIColor.blue, UIColor.systemBlue], locations: [0.0, 1.0])
        button3.applyGradient2(colors: [UIColor(red: 0.95, green: 0.77, blue: 0.06, alpha: 0.8), UIColor(red: 0.85, green: 0.65, blue: 0.13, alpha: 0.8)], locations: [0.0, 1.0])
    }

    @objc private func button1Action() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let meuViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            navigationController?.pushViewController(meuViewController, animated: true)
        }
    }
    
    @objc private func button2Action() {
        let historyViewController = HistoryDemoViewController()
        navigationController?.pushViewController(historyViewController, animated: true)
    }
    
    @objc private func button3Action() {
        let storyboard = UIStoryboard(name: "Purchase",bundle: nil)
        let purchaseVC = storyboard.instantiateViewController(withIdentifier: "Purchase")
        self.present(purchaseVC, animated: true)
    }
}

extension UIButton {
    func applyGradient(colors: [UIColor], locations: [NSNumber]? = nil) {
        let gradientLayer = CAGradientLayer()
        // Ajusta as cores para aplicar o alpha de 0.8
        let alphaColors = colors.map { $0.withAlphaComponent(0.8).cgColor }
        gradientLayer.colors = alphaColors
        gradientLayer.locations = locations
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        // Remove gradientes anteriores para evitar sobreposições
        if let oldGradientLayer = self.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            oldGradientLayer.removeFromSuperlayer()
        }
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradient2(colors: [UIColor], locations: [NSNumber]? = nil) {
        let gradientLayer = CAGradientLayer()
        // Ajusta as cores para aplicar o alpha de 0.8
        let alphaColors = colors.map { $0.withAlphaComponent(0.9).cgColor }
        gradientLayer.colors = alphaColors
        gradientLayer.locations = locations
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.layer.cornerRadius
        gradientLayer.masksToBounds = true
        // Remove gradientes anteriores para evitar sobreposições
        if let oldGradientLayer = self.layer.sublayers?.first(where: { $0 is CAGradientLayer }) {
            oldGradientLayer.removeFromSuperlayer()
        }
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
