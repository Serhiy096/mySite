//
//  ViewController.swift
//  GravityDemo
//
//  Created by Admin on 14.09.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var firstContact = false
    var square: UIView!
    var snap: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        square = UIView(frame: CGRect(x:100, y:100, width:100, height:100))
        square.backgroundColor = UIColor.grayColor()
        view.addSubview(square)
        
        let barrier = UIView(frame: CGRect(x:0, y:300, width:130, height:20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        animator.addBehavior(gravity)
       
        collision = UICollisionBehavior(items: [square])
        collision.addBoundaryWithIdentifier("barrier", forPath: UIBezierPath(rect: barrier.frame))
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        collision.collisionDelegate = self
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?)
        {
            
        if (snap != nil) {
            animator.removeBehavior(snap)
        }
        
        let touch = touches.first
        snap = UISnapBehavior(item: square, snapToPoint: touch!.locationInView(view))
        animator.addBehavior(snap)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

