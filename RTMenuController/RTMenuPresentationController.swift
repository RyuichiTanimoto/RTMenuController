//
//  RTMenuPresentationController.swift
//  RTMenuController
//
//  Created by Ryuichi Tanimoto on 11/19/16
//  Copyright (c) 2016 Ryuichi Tanimoto. All rights reserved.
//

import UIKit
import swift_utilities

internal class RTMenuPresentationController: UIPresentationController {
    
    private var overlay: UIView?
    
    @objc internal func overlayDidTouch(sender: AnyObject) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width * 0.8, height: parentSize.height)
    }
    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect.zero
        containerView.forEach {
            presentedViewFrame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: $0.bounds.size)
            presentedViewFrame.origin.x = $0.bounds.origin.x
            presentedViewFrame.origin.y = $0.bounds.origin.y
        }
        return presentedViewFrame
    }
    override func containerViewWillLayoutSubviews() {
        overlay?.frame = containerView?.bounds ?? CGRect.zero
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    override func containerViewDidLayoutSubviews() {
    }
    override func presentationTransitionWillBegin() {
        overlay = UIView(frame: containerView?.bounds ?? CGRect.zero)
        overlay?.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(self.overlayDidTouch(sender:)))]
        overlay?.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        overlay?.alpha = 0.0
        overlay.forEach {containerView?.insertSubview($0, at: 0)}
        presentedViewController.transitionCoordinator?.animate(alongsideTransition:
            {[unowned self] animation in
                self.overlay?.alpha = 0.8
            }, completion: nil
        )
    }
    override func presentationTransitionDidEnd(_ completed: Bool) {
    }
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition:
            {[unowned self] animation in
                self.overlay?.alpha = 0.0
            }, completion: nil
        )
    }
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlay?.removeFromSuperview()
        }
    }
}
