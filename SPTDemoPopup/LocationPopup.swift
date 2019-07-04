//
//  LocationPopup.swift
//  SPTDemoPopup
//
//  Created by Quentin Beaudouin on 04/07/2019.
//  Copyright © 2019 Singlespot. All rights reserved.
//

import UIKit

import SPTProximityKit

class LocationPopup: SPTCustomLocationPopup {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var buttonOk: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        super.messageLabel = self.labelMessage
        super.okButton = self.buttonOk
        super.titleLabel = self.labelTitle
        super.cancelButton = self.buttonCancel
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func showWithAnimation() {
        let views = [labelTitle, labelMessage, buttonOk, buttonCancel];
        
        for view in views {
            view?.transform = CGAffineTransform(translationX: 0, y: -90)
            view?.alpha = 0
        }
        
        let animMultiplier:TimeInterval = 2
        var i = 0
        for view in views {
            UIView.animate(withDuration: 0.2*animMultiplier,
                           delay: (0.1 + 0.05 * Double(i))*animMultiplier,
                           usingSpringWithDamping: 0.6,
                           initialSpringVelocity: 0,
                           options: [],
                           animations: {
                            view?.alpha = 1
                            view?.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            
            i += 1
        }
    }
    
    override func hideWithAnimation() {
        let views = [labelTitle, labelMessage, buttonOk, buttonCancel];
        
        for view in views {
            view?.transform = CGAffineTransform(translationX: 0, y: -90)
            view?.alpha = 0
        }
        
        var i = 0
        for view in views {
            UIView.animateKeyframes(withDuration: 0.2, delay: Double(i)*0.15, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                    view?.transform = CGAffineTransform(translationX: 0, y: 90/7)
                })
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                    view?.transform = CGAffineTransform(translationX: 0, y: -90)
                    view?.alpha = 0
                })
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 0.8, animations: {
            self.alpha = 0
        }) { (finished) in
            self.removeFromSuperview()
        }
        i += 1
    }

}
