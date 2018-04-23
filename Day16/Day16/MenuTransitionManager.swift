//
//  MenuTransitionManager.swift
//  Day16
//
//  Created by canoe on 2018/4/23.
//  Copyright © 2018年 canoe. All rights reserved.
//

import UIKit



class MenuTransitionManager: NSObject,UIViewControllerAnimatedTransitioning {
    
    enum MenuTransitionType:Int {
        case Present = 0,Dissmiss
    }
    
    var type : MenuTransitionType = .Present
    var snapshot : UIView!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        switch type {
        case .Present:
            self.animatePresentTransition(transitionContext: transitionContext)
        case .Dissmiss:
            self.animateDissmissTransition(transitionContext: transitionContext)
        }
    }
    
    func animatePresentTransition(transitionContext: UIViewControllerContextTransitioning) {
        //跳转操作
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        let container = transitionContext.containerView
        let moveDown = CGAffineTransform(translationX: 0, y: container.frame.height - 300)
        let moveUp = CGAffineTransform(translationX: 0, y: -50)
        toView.transform = moveUp
        self.snapshot = fromView.snapshotView(afterScreenUpdates: false)
        container.addSubview(toView)
        container.addSubview(self.snapshot!)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
                self.snapshot?.transform = moveDown
                toView.transform = CGAffineTransform.identity
        }, completion: { finished in
            transitionContext.completeTransition(true)
        })
    }
    
    func animateDissmissTransition(transitionContext: UIViewControllerContextTransitioning) {
        //返回操作
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        let container = transitionContext.containerView
//        let moveDown = CGAffineTransform(translationX: 0, y: 0)
        let moveUp = CGAffineTransform(translationX: 0, y: -50)
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            self.snapshot?.transform = CGAffineTransform(translationX: 0, y: container.frame.height - 300)
            fromView.transform = moveUp
        }, completion: { finished in
            transitionContext.completeTransition(true)
            self.snapshot?.removeFromSuperview()
        })
    }
}
