import UIKit
import SnapKit
//import ZLSwipeableViewSwift
import UIColor_FlatColors
import Cartography

class CardView: UIView {
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "titleLabel"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .vertical)
        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "descriptionLabel"
        label.textAlignment = .center
        label.font = UIFont.italicSystemFont(ofSize: 24)
        label.numberOfLines = 0
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
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.bottom.equalToSuperview().offset(-100)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
    }
}
