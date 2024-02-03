import UIKit
import SnapKit
//import ZLSwipeableViewSwift
import UIColor_FlatColors
import Cartography


class CardView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white

        // Configurando a fonte para negrito e itálico
        let fontDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline)
            .withSymbolicTraits([.traitBold, .traitItalic])
        if let fontDescriptor = fontDescriptor {
            label.font = UIFont(descriptor: fontDescriptor, size: 24)
        } else {
            label.font = UIFont.systemFont(ofSize: 24) // Fonte padrão caso a personalizada falhe
        }

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 4.0
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 10.0;
        
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().offset(-60)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.bottom.equalToSuperview().offset(-120)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
}
