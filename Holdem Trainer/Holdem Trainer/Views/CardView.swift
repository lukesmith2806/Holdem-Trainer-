//
//  CardView.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 9/7/22.
//

import UIKit
import PlayingCard
import SnapKit

class CardView: UIView {
    let rankLabel = UILabel()

    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(rankLabel)
        rankLabel.adjustsFontSizeToFitWidth = true
        rankLabel.font = .systemFont(ofSize: 1000)
        rankLabel.snp.makeConstraints { make in
            //make.width.equalToSuperview()
            //make.height.equalToSuperview()
            make.edges.equalToSuperview()
        }
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func updateCard(_ card: PlayingCard) {
        rankLabel.text = card.rank.description
    }
    func updateCard(_ cardString: String ){
        rankLabel.text = cardString
    }
    func drawCardBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3.0
        self.layer.cornerRadius = 10

    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCardBorder()
    }
}
