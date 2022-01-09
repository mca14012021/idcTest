//
//  String+Extension.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation

extension String{
    var isValid: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^.{3,11}$").evaluate(with: self)
    }
}

