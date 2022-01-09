//
//  NetworkManagerWrapper.swift
//  test
//
//  Created by Lucky on 09/01/22.
//


import Foundation
import Alamofire

public typealias SuccessClosure = (_ data: Data?) -> (Void)
public typealias FailureClosure = (_ error: Error?, _ data: Data?, _ statusCode: Int?) -> (Void)


class NetworkManagerWrapper: NSObject {
  
  static func makeRequest(_ requestParamter: RequestParameter, encoding: ParameterEncoding = JSONEncoding.default, success: @escaping SuccessClosure, failure: @escaping FailureClosure) {
    if Reachability.isConnectedToNetwork(){
        print("Internet Connection Available!")
        let request = AF.request(requestParamter.url,method:requestParamter.method, parameters: requestParamter.parameters, encoding: encoding, headers: HTTPHeaders(requestParamter.headers ?? ["":""])){ $0.timeoutInterval = 60 }
        if(requestParamter.isShowPopUp!){
            
        }
        request.responseData{ (dataResponse) in
        print(dataResponse.response?.statusCode as Any)
        if(requestParamter.isShowPopUp!){
        }
        print(dataResponse)
      #if DEBUG
        if let data = dataResponse.value {
          let responseString = String(data: data, encoding: .utf8)
          if responseString != nil {
       //     debugPrint("Response string:\(responseString!)")
          }
          else {
          //  debugPrint("Response string is null")
          }
        }
      #endif

      if let error = dataResponse.error {
        debugPrint(error)
        do{
            if let data = dataResponse.data{
                let jsonData = try (JSONSerialization.jsonObject(with: data,options: .allowFragments) as! [String:Any])
                           print( jsonData )
                           failure(error, data, nil)
            }else {
                
            }
           
        }catch{
          failure(error, nil, nil)
        }
        
      }
      else if dataResponse.response?.statusCode == 200 || dataResponse.response?.statusCode == 201 {
        do{
            if let data = dataResponse.data{
                let jsonData = try (JSONSerialization.jsonObject(with: data,options: .allowFragments) as! [String:Any])
                           print( jsonData )
                           success(data)
            }else {
                success(nil)
            }
           
        }catch{
           success(nil)
        }
      } else {
        // if status code is not 200 (success)
        do{
            if let data = dataResponse.data{
                let jsonData = try (JSONSerialization.jsonObject(with: data,options: .allowFragments) as! [String:Any])
                           print( jsonData )
                           failure(nil, data, dataResponse.response?.statusCode)
            }else {
                 failure(nil, nil, dataResponse.response?.statusCode)
            }
        }catch{
          failure(nil, nil, dataResponse.response?.statusCode)
        }
      }
    }
    }else{

    }
  }
}


