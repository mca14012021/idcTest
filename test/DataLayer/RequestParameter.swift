
import Alamofire

open class RequestParameter {
    
  var url: String
  
  /// Method type e.g. GET/POST etc.
  var method: Alamofire.HTTPMethod
  
  /// Headers needed for the api call
  var headers: [String: String]?
  
  /// Url encoded parameters
  var parameters: [String: Any]?
    
  var isShowPopUp:Bool?
    
  var viewController:UIViewController?

    fileprivate init(url: String, method: Alamofire.HTTPMethod, headers: [String: String]? = nil, parameters: [String: Any]? = nil,isShowPopUp:Bool,viewController:UIViewController?) {
    self.url = url
    self.method = method
    self.headers = headers
    self.parameters = parameters
    self.isShowPopUp = isShowPopUp
    self.viewController = viewController
  }

  public static func createRequestParameter(_ url: String, method: Alamofire.HTTPMethod, headers: [String: String]? = nil, parameters: [String: Any]? = nil,isShowPopUp:Bool,viewController:UIViewController?) -> RequestParameter {
    return RequestParameter(url: url, method: method, headers: headers, parameters: parameters,isShowPopUp: isShowPopUp,viewController: viewController)
  }

}
