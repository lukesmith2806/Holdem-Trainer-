//
//  GamesNavigationController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 11/2/22.
//

import UIKit

class GamesNavigationController: UINavigationController {
    let gameList = GameListViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Games"
        gameList.navigationItem.title = "Games"
        tabBarItem.image = UIImage(systemName: "gamecontroller")
        pushViewController(gameList, animated: true)
        self.navigationBar.isOpaque = true
        self.navigationBar.barTintColor = .cyan
        
        self.navigationBar.tintColor = .brown
        self.view.backgroundColor = .red
    }
    

    

}
