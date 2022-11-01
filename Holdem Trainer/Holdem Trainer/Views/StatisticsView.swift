//
//  StatisticsView.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 5/26/22.
//

import UIKit
import Logging
import SnapKit

class StatisticsView: UIView {
    
    let stackView = UIStackView()
    let statisticsArray: [GameScore]
    let statsText = UITextView()
    
    // View that contains text view to display rules text for game
    // Will be updated in the future to contain statistics
    
    

    
    
    
    override init(frame: CGRect) {
        Logger.viewCycle.info("Statistics View initialized")
        //loads statistics from database
        statisticsArray = DataManager.shared.getAll()
        super.init(frame: frame)
        createSubviews()
        self.backgroundColor = globalBackgroundColor
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        Logger.viewCycle.info("Statistics View initialized")
        //Initializes array with data from DB
        statisticsArray = DataManager.shared.getAll()
        super.init(coder: aDecoder)
        createSubviews()
    }
   
    
    func createSubviews() {
        self.addSubview(stackView)
        stackView.axis = .vertical
        
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
        }
        // Game Rules Text
        statsText.text = "Rules for the Game are as Follows: 3 Poker hands are presented, Choose the hand with the highest value according to Chen's Formula, all answers tied for the highest value will be considered correct"
        statsText.backgroundColor = globalBackgroundColor
        statsText.font = UIFont(name: "Helvetica", size: 20)
        statsText.isEditable = false    
        stackView.addArrangedSubview(statsText)
        
    
        
        
    }
   
    func updateSubviews() {
        
    }
    
}
