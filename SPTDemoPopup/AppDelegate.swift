//
//  AppDelegate.swift
//  SPTDemoPopup
//
//  Created by Quentin Beaudouin on 04/07/2019.
//  Copyright © 2019 Singlespot. All rights reserved.
//

import UIKit
import SPTProximityKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupLocationPrepopup()
        setupIDFAPrepopup()
        
        //TODO: change here to try .onDemand
        SPTProximityManager.setLocationMode(.serverBased)
        
        //TODO: change here to try .onDemand
        SPTProximityManager.setIDFARequestMode(.serverBased)
    
        SPTProximityManager.setApiKey(YOUR_API_KEY, secret: YOUR_API_SECRET)
        return true
    }
    
    func setupLocationPrepopup() {
        
        let conf = SPTLocationPopupConfiguration()

        conf.inUseMessage =  NSLocalizedString("inUseMessage", comment: "")
        conf.alwaysMessage = NSLocalizedString("alwaysImmediatlyMessage", comment: "")
        conf.toSettingsMessage = NSLocalizedString("retryMessage", comment: "")
        
        conf.inUseTitle = NSLocalizedString("inUseTitle", comment: "")
        conf.alwaysTitle = NSLocalizedString("alwaysImmediatlyTitle", comment: "")
        conf.toSettingsTitle = NSLocalizedString("retryTitle", comment: "")
        
        conf.okButtonTitle = NSLocalizedString("okButtonTitle", comment: "")
        conf.okToSettingsButtonTitle = NSLocalizedString("okToSettingsButtonTitle", comment: "")
        conf.cancelButtonTitle = NSLocalizedString("cancelButtonTitle", comment: "")
        conf.lastCancelButtonTitle = NSLocalizedString("lastCancelButtonTitle", comment: "")
        
        
        if let popup = Bundle.main.loadNibNamed("LocationPopup", owner: self, options: nil)?.first as? SPTCustomPopup {
            SPTProximityManager.setCustomLocationPopup(popup)
        }
        
        SPTProximityManager.setUseLocationPrepopup(true)
        
        
    }
    
    func setupIDFAPrepopup() {
        
        let conf = SPTIDFAPopupConfiguration()

        conf.firstTimeMessage =  NSLocalizedString("IDFAfirstTimeMessage", comment: "")
        conf.retryMessage = NSLocalizedString("IDFAretryMessage", comment: "")
        conf.retryToSettingsMessage = NSLocalizedString("IDFAretryToSettingsMessage", comment: "")
        
        conf.firstTimeTitle = NSLocalizedString("IDFAfirstTimeTitle", comment: "")
        conf.retryTitle = NSLocalizedString("IDFAretryTitle", comment: "")
        conf.retryToSettingsTitle = NSLocalizedString("IDFAretryToSettingsTitle", comment: "")
        
        conf.okButtonTitle = NSLocalizedString("okButtonTitle", comment: "")
        conf.okToSettingsButtonTitle = NSLocalizedString("okToSettingsButtonTitle", comment: "")
        conf.cancelButtonTitle = NSLocalizedString("cancelButtonTitle", comment: "")
        conf.lastCancelButtonTitle = NSLocalizedString("lastCancelButtonTitle", comment: "")
        
        
        if let popup = Bundle.main.loadNibNamed("IDFAPopup", owner: self, options: nil)?.first as? SPTCustomPopup {
            SPTProximityManager.setCustomIDFAPopup(popup)
        }
        
        SPTProximityManager.setUseIDFAPrepopup(true)
        
        
    }

}

