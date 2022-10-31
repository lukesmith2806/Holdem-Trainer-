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
        self.backgroundColor = UIColor(red: 99/255, green: 0, blue: 0, alpha: 1)
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
