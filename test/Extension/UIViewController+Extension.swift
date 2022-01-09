//
//  UIViewController+Extension.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation
import UIKit
import Toast_Swift

extension UIViewController{
    func showToast(message:String){
        self.view.makeToast(message,duration:1.0,position:.bottom)
    }
    class var storyboardID : String {
          return "\(self)"
      }
      static func instantiateFromAppStoryboard(appStoryboard: AppStoryboard) -> Self {
          return appStoryboard.viewController(viewControllerClass: self)
      }
}
