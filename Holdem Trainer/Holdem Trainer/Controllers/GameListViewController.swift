//
//  GameListViewController.swift
//  Holdem Trainer
//
//  Created by Luke Smith  on 10/29/22.
//

import UIKit
import SnapKit

class GameListViewController: UIViewController {
    var tableView = UITableView()
    var games: [String] = []
    var gameDict: [String: UIViewController] = ["Untimed Chen Game": ChenGameViewController(), "Timed Chen Game": TimedChenGameViewController()]
    var sections: [String: Int] = ["Timed": 1, "Untimed": 2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Games"
        configureTableView()
        games = fetchData()
        navigationController?.navigationBar.isOpaque = true
        navigationController?.isNavigationBarHidden = false
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        //Set TableView delegates
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        tableView.register(GameListTableViewCell.self, forCellReuseIdentifier: "GameCell")


}
    func fetchData() -> [String] {
        return["Untimed Chen Game", "Timed Chen Game"]
    }
    
}

extension GameListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell") as! GameListTableViewCell
        let title = games[indexPath.row]
        cell.setTitle(title: title)
        print(cell)
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let gameVC = gameDict[games[indexPath.row]] {
            navigationController?.pushViewController(gameVC, animated: true)
           
        }
    }
    

    
   
}

