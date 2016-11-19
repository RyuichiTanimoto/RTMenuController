//
//  RTMenuControllerDelegate.swift
//  RTMenuController
//
//  Created by Ryuichi Tanimoto on 11/21/16
//  Copyright (c) 2016 Ryuichi Tanimoto. All rights reserved.
//

@objc public protocol RTMenuControllerDelegate: NSObjectProtocol {
    @objc optional func menuControllerDidEndPresentAnimation(_ transitionCompleted: Bool)
    @objc optional func menuControllerDidEndDismissalAnimation(_ transitionCompleted: Bool)
}
