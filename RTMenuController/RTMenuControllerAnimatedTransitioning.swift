//
//  RTMenuControllerAnimatedTransitioning.swift
//  RTMenuController
//
//  Created by Ryuichi Tanimoto on 11/19/16
//  Copyright (c) 2016 Ryuichi Tanimoto. All rights reserved.
//

import UIKit
import swift_utilities

internal class RTMenuControllerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    private let mode: RTMenuControllerAnimatedTransitioningMode
    private var delegate: RTMenuControllerDelegate?
    
    internal init(for mode: RTMenuControllerAnimatedTransitioningMode, delegate: RTMenuControllerDelegate?) {
        self.mode = mode
        self.delegate = delegate
    }
    
    private func animatePresentTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from).forEach {from in transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to).forEach
            {to in
                let containerView = transitionContext.containerView
                containerView.insertSubview(to.view, belowSubview: from.view)
                UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations:
                    {
                        to.view.frame.origin.x = to.view.frame.size.width * 0.8
                    }, completion: {finished in
                        transitionContext.completeTransition(true)
                    }
                )
            }
        }
    }
    private func animateDismissalTransition(using transitionContext: UIViewControllerContextTransitioning) {
        transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from).forEach {from in
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations:
                {
                    from.view.frame.origin.x -= from.view.frame.size.width
                }, completion: {finished in
                    transitionContext.completeTransition(true)
                }
            )
        }
    }
    
    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch mode {
        case .Presented:
            animatePresentTransition(using: transitionContext)
        case .Dismissed:
            animateDismissalTransition(using: transitionContext)
        }
    }
    internal func animationEnded(_ transitionCompleted: Bool) {
        switch mode {
        case .Presented:
            delegate?.menuControllerDidEndPresentAnimation?(transitionCompleted)
        case .Dismissed:
            delegate?.menuControllerDidEndDismissalAnimation?(transitionCompleted)
        }
    }
    internal func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
}

public enum RTMenuControllerAnimatedTransitioningMode {
    case Presented
    case Dismissed
}
