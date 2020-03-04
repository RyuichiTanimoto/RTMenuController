//
//  MenuController.swift
//  RTMenuControllerDemo
//
//  Created by Ryuichi Tanimoto on 11/21/16.
//  Copyright © 2016 RyuichiTanimoto. All rights reserved.
//

import UIKit
import RTMenuController

class MenuController: RTMenuController, UITableViewDataSource {

    let tableView: UITableView
    
    override init() {
        tableView = UITableView()
        super.init(backgroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.layer.cornerRadius = 10.0
        tableView.layer.borderWidth = 1.0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = indexPath.row.description
        return cell
    }
}
