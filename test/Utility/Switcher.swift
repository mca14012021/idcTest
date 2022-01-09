//
//  Switcher.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation
import UIKit

class Switcher {
    static func updateRootVC(window:UIWindow) {
        if  CoreDataStore.shared.getUserData().userName.isEmpty {
            Constant.navigateToRootLogin(window: window)
        }else {
            Constant.navigateToRootHome(window: window)
        }
    }
}
class Constant: NSObject{
    
    class func navigateToRootLogin(window:UIWindow){
        let loginVc = Login.instantiateFromAppStoryboard(appStoryboard: .Main)
        let nav = UINavigationController()
        nav.viewControllers = [loginVc]
        nav.isNavigationBarHidden = true
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }

    class func navigateToRootHome(window:UIWindow){
        let homeVC = Home.instantiateFromAppStoryboard(appStoryboard: .Main)
        let nav = UINavigationController()
        nav.viewControllers = [homeVC]
        nav.isNavigationBarHidden = true
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }

    class func logOut()
    {
        if let window = UIWindow.key{
            Switcher.updateRootVC(window: window)
        }
    }
}
enum AppStoryboard : String {
    
    case Main = "Main"
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
   }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        return instance.instantiateViewController(withIdentifier: storyboardID) as! T
    }
}
