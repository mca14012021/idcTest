

import Alamofire

open class ApiCall {
    public static func getTournamentInfo(_ cursor:String,_ isShowPopUp:Bool,_ viewController:UIViewController?,success: @escaping SuccessClosure, failure: @escaping FailureClosure) {
        DispatchQueue.main.async {
            let headers = ["Accept": "application/json"]
            let url = URLS.tournament + "?limit=10&status=all&cursor=\(cursor)"
            
            let requestParameter = RequestParameter.createRequestParameter(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, method: .get, headers: headers, parameters: nil,isShowPopUp:isShowPopUp,viewController:viewController)
            NetworkManagerWrapper.makeRequest(requestParameter, success: success, failure: failure)
        }
    }
    
  
}
