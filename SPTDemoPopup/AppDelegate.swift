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
        
        let conf = SPTLocationPopupConfiguration()

        conf.inUseMessage =  NSLocalizedString("inUseMessage", comment: "")
        conf.alwaysImmediatlyMessage = NSLocalizedString("alwaysImmediatlyMessage", comment: "")
        conf.alwaysAfterInUseMessage = NSLocalizedString("alwaysAfterInUseMessage", comment: "")
        conf.retryMessage = NSLocalizedString("retryMessage", comment: "")
        conf.retryToSettingsMessage = NSLocalizedString("retryToSettingsMessage", comment: "")
        
        conf.inUseTitle = NSLocalizedString("inUseTitle", comment: "")
        conf.alwaysImmediatlyTitle = NSLocalizedString("alwaysImmediatlyTitle", comment: "")
        conf.alwaysAfterInUseTitle = NSLocalizedString("alwaysAfterInUseTitle", comment: "")
        conf.retryTitle = NSLocalizedString("retryTitle", comment: "")
        conf.retryToSettingsTitle = NSLocalizedString("retryToSettingsTitle", comment: "")
        
        conf.okButtonTitle = NSLocalizedString("okButtonTitle", comment: "")
        conf.okToSettingsButtonTitle = NSLocalizedString("okToSettingsButtonTitle", comment: "")
        conf.cancelButtonTitle = NSLocalizedString("cancelButtonTitle", comment: "")
        conf.cancelToSettingsButtonTitle = NSLocalizedString("cancelToSettingsButtonTitle", comment: "")
        conf.lastCancelButtonTitle = NSLocalizedString("lastCancelButtonTitle", comment: "")
        
        
        if let popup = Bundle.main.loadNibNamed("LocationPopup", owner: self, options: nil)?.first as? SPTCustomLocationPopup {
            SPTProximityManager.setCustomLocationPopup(popup)
        }
        
        
        SPTProximityManager.setApiKey(<Your api key>, secret: <Your api key>, locationMode: .serverBased, isCMP: false)
        return true
    }

}

