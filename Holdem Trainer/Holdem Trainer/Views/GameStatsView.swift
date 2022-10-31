//
//  GameStatsView.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/31/22.
//

import UIKit

class GameStatsView: UIView {
    var game = String()
    
    override init(frame: CGRect) {
       
        super.init(frame: frame)
        createSubviews()
        self.backgroundColor = globalBackgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubviews()
    }
   
    func createSubviews() {
        
    }
    
    func setup(game: String) {
        
    }
}
