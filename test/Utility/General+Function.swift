//
//  General+Function.swift
//  test
//
//  Created by Lucky on 09/01/22.
//

import Foundation

func checkUserExist(userName:String,password:String)->Bool{
    if userName == "9898989898" && password == "password123"{
        return true
    }else if userName == "9876543210" && password == "password123"{
        return true
    }else {
        return false
    }
    
}
