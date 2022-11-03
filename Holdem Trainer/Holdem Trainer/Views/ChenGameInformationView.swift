//
//  ChenGameInformationView.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 11/3/22.
//

import UIKit
import Logging

class ChenGameInformationView: UIView {

    override init(frame: CGRect) {
        Logger.viewCycle.info("ChenGameInfo view initialized")
        super.init(frame: frame)

        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        Logger.viewCycle.info("ChenGameInfo view initialized")
        super.init(coder: aDecoder)
   
    }

}
