//
//  GameListTableViewCell.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/29/22.
//

import UIKit

class GameListTableViewCell: UITableViewCell {
    var gameNameLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(gameNameLabel)
        configureLabel()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        gameNameLabel.text = title
    }
    
    func configureLabel() {
        gameNameLabel.numberOfLines = 0
        gameNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setLabelConstraints() {
        gameNameLabel.translatesAutoresizingMaskIntoConstraints = false
        gameNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        gameNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        gameNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        gameNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
