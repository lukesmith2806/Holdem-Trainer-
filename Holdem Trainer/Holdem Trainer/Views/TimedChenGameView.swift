//
//  TimedChenGameView.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/31/22.
//

import UIKit
import Logging
import SnapKit

class TimedChenGameView: UIView {
    let stackView = UIStackView()
    
    
    var scorelabel = UILabel()
    var timeLabel = UILabel()
    var handArray = [String]()
    var buttonOne = ChenGameButton()
    var buttonTwo = ChenGameButton()
    var buttonThree = ChenGameButton()
    var buttonArray = [ChenGameButton]()

    
    
    
    override init(frame: CGRect) {
        Logger.viewCycle.info("Timed Chen View initialized")
        super.init(frame: frame)
        createSubviews()
        self.backgroundColor = globalBackgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        Logger.viewCycle.info("Timed Chen View initialized")
        super.init(coder: aDecoder)
        createSubviews()
    }
   
    
    func createSubviews() {
        self.addSubview(stackView)
        buttonArray = [buttonOne, buttonTwo, buttonThree]
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(safeAreaLayoutGuide.snp.leftMargin)
            make.right.equalTo(safeAreaLayoutGuide.snp.rightMargin)
            make.top.equalTo(safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin)
        }
        
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 16
        buttonStack.distribution = .fillEqually
        for button in buttonArray {
            let horizontalStack = UIStackView()
            horizontalStack.axis = .horizontal
            horizontalStack.spacing = 16
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.setupButton()
            horizontalStack.addArrangedSubview(button)
            buttonStack.addArrangedSubview(horizontalStack)
        
        }
        
        
      
        
        let labelStack = UIStackView()
        labelStack.axis = .vertical
        labelStack.spacing = 16
        labelStack.distribution = .fillEqually
        
        timeLabel.textAlignment = .center
        timeLabel.text = "10"
        timeLabel.font = timeLabel.font.withSize(100)
     
        scorelabel.textAlignment = .center
        scorelabel.text = "0"
        scorelabel.font = scorelabel.font.withSize(100)
        
        labelStack.addArrangedSubview(timeLabel)
        labelStack.addArrangedSubview(scorelabel)
        
        
        stackView.addArrangedSubview(buttonStack)
        stackView.addArrangedSubview(labelStack)
       
    
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
    }
    
    func updateTimeLabel(input: String) {
        timeLabel.text = input
    }
    
    func initializeArr(_ hands: [String]) {
        handArray.removeAll()
        for str in hands {
            handArray.append(str)
        }
        Logger.info.info("Hands in Array \(handArray)")
        for i in 0..<buttonArray.count {
            buttonArray[i].setTitle(hands[i], for: .normal)
            
        }
    }
    
    func updateSubviews(_ hands: [String], score: Int) {
        handArray.removeAll()
        for i in 0..<buttonArray.count {
            buttonArray[i].setTitle(hands[i], for: .normal)
    
        }
        scorelabel.text = String(score)

        
        
        
    }


  
}
