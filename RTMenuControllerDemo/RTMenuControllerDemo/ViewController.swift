//
//  ViewController.swift
//  RTMenuControllerDemo
//
//  Created by Ryuichi Tanimoto on 11/19/16.
//  Copyright © 2016 RyuichiTanimoto. All rights reserved.
//

import UIKit
import RTMenuController

class ViewController: UIViewController, RTMenuControllerDelegate {

    let button: UIButton
    
    init() {
        button = UIButton()
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        button = UIButton()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        view.addSubview(button)
        button.setTitle(" TOUCH ", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.buttonDidTouch(sender:)), for: UIControlEvents.touchUpInside)
        button.layer.borderWidth = 1.0
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.sizeToFit()
        button.center = CGPoint(x: view.center.x, y: view.center.y)
    }
    
    func buttonDidTouch(sender: UIButton) {
        let mc = MenuController()
        mc.delegate = self
        self.present(mc, animated: true, completion: nil)
    }
    
    func menuControllerDidEndPresentAnimation(_ transitionCompleted: Bool) {
        print("menu opened")
    }
    func menuControllerDidEndDismissalAnimation(_ transitionCompleted: Bool) {
        print("menu closed")
    }
}

class TestController: UIViewController, UITableViewDataSource {
    //@available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    //@available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
