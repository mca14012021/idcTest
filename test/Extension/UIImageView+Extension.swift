//
//  UIImageView+Extension.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView{
    func addImage(url:String,placeholderImage:String){
        let transformer = SDImageResizingTransformer(size: CGSize(width:self.frame.size.width, height: self.frame.size.height), scaleMode: .fill)
        self.sd_setImage(with: URL(string:url), placeholderImage: UIImage(named:placeholderImage), options: SDWebImageOptions.continueInBackground, context: [.imageTransformer: transformer])
    }
}
