//
//  RTMenuController.swift
//  RTMenuController
//
//  Created by Ryuichi Tanimoto on 11/19/16
//  Copyright (c) 2016 Ryuichi Tanimoto. All rights reserved.
//

import UIKit

open class RTMenuController: UIViewController, UIViewControllerTransitioningDelegate {

    fileprivate var backgroundColor: UIColor = UIColor.white
    public var delegate: RTMenuControllerDelegate?

    public init() {
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    public init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        super.init(nibName: nil, bundle: nil)
        initialize()
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        modalPresentationStyle = UIModalPresentationStyle.custom
        transitioningDelegate = self
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = backgroundColor
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RTMenuControllerAnimatedTransitioning(for: .Presented, delegate: delegate)
    }
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return RTMenuControllerAnimatedTransitioning(for: .Dismissed, delegate: delegate)
    }
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return RTMenuPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
