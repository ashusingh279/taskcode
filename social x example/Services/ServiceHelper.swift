//
//  ServiceHelper.swift
//  Template
//
//  Created by Chandra_Mobiloitte on 27/06/16.
//  Copyright © 2018 Mobiloitte. All rights reserved.
// 570d822a3f9e0d7a84f439a951c1ef7eaf2798a641d182e1b1d8d99e49700b5e

import MobileCoreServices
import UIKit


/*
 =======================================
 Webservices base URL
 =======================================
 */


let WEBSERVICES_BASE_URL = DEVELOPMENT_WEBSERVICES_BASEURL

let timeoutInterval: Double = 45.0

enum loadingIndicatorType: CGFloat {
    case `default` = 0 // showing indicator & text by disable UI
    case simple = 1 // showing indicator only by disable UI
    case noProgress = 2 // without indicator by disable UI
    case smoothProgress = 3 // without indicator by enable UI i.e No hud
    case progress = 4
}

enum MethodType: CGFloat {
    case get = 0
    case post = 1
    case put = 2
    case delete = 3
    case patch = 4
}

// HTTP Header Fields Constant
let contentType     = "Content-Type"
let acceptLanguage  = "Accept-Language"
let authorization   = "Authorization"

@available(iOS 13.0, *)
class ServiceHelper: NSObject {
    
    class func request(_ parameterDict: [String: Any], method: MethodType, apiName: String, hudType: loadingIndicatorType, completionBlock: @escaping (AnyObject?, Error?, Int) -> Void) {
        
        if !appdelegate.checkReachablility(){
            AlertController.alert(title: _ERROR_MESSAGE_TITLE, message: _INTERNET_CONNECTION_CHECK)
            return
        }

        
        switch method {
            
            // ==============================================
            case .get:
            // ==============================================
            var getRequestParameter:String = ""
            
            for key in parameterDict.keys {
                let parametrValue = parameterDict[key] as! String
                getRequestParameter = getRequestParameter + "/" + parametrValue
            }
            let url =  NSURL(string : WEBSERVICES_BASE_URL + apiName + getRequestParameter)
            var request = URLRequest(url : url! as URL)
            request.httpMethod = _GET_METHOD
            request.timeoutInterval = timeoutInterval
            request.addValue(_CONTENT_TYPE, forHTTPHeaderField: contentType)

         //    request.addValue("\(defaults.value(forKey: _ACCESS_TOKEN) as! String)", forHTTPHeaderField: "token")
            
            //MBProgressHUD.showAdded(to: (appdelegate.navController?.topViewController?.view!)!, animated: true)
            //appdelegate.navController?.topViewController?.showBlankIndicator()
            
//            if let topView = appdelegate.navController?.topViewController {
//                topView.showBlankIndicator()
//            }
            
           //   SVProgressHUD.show()
            request.perform(hudType: hudType) { (responseObject: AnyObject?, error: Error?, httpResponse: HTTPURLResponse) in
                DispatchQueue.main.async(execute: {
                    //MBProgressHUD.hide(for: (appdelegate.navController?.topViewController?.view!)!, animated: true)
           //       SVProgressHUD.dismiss()
                    
                    
                    
                    completionBlock(responseObject, error, httpResponse.statusCode)
                })
            }
            
            
        // ==============================================
        case .post:
            // ==============================================
            
            let url =  NSURL(string : WEBSERVICES_BASE_URL + apiName )
            var request = URLRequest(url : url! as URL)
            request.httpMethod = _POST_METHOD
            request.timeoutInterval = timeoutInterval
            request.addValue(_CONTENT_TYPE, forHTTPHeaderField: contentType)
           
//            if apiName == API_LOGIN || apiName == API_SIGNUP || apiName == API_FORGOTPASSWORD
//            {
//            //request.addValue("\(defaults.value(forKey: _ACCESS_TOKEN) as! String)", forHTTPHeaderField: "token")
//            }else{
       //         request.addValue("\(defaults.value(forKey: _ACCESS_TOKEN) as! String)", forHTTPHeaderField: "token")
         //   }
            
 
            let jsonData = parameterDict.toData()
            request.httpBody = jsonData
           
           // MBProgressHUD.showAdded(to: (appdelegate.navController?.topViewController?.view!)!, animated: true)
          //    SVProgressHUD.show()
               request.perform(hudType: hudType) { (responseObject: AnyObject?, error: Error?, httpResponse: HTTPURLResponse) in
                
                DispatchQueue.main.async(execute: {
                    //MBProgressHUD.hide(for: (appdelegate.navController?.topViewController?.view!)!, animated: true)
              //   SVProgressHUD.dismiss()
                    completionBlock(responseObject, error, httpResponse.statusCode)
                    
                })
            }
        // ==============================================
        case .put:
            // ==============================================
            
            let url =  NSURL(string : WEBSERVICES_BASE_URL + apiName )
            var request = URLRequest(url : url! as URL)
            request.httpMethod = _PUT_METHOD
            request.timeoutInterval = timeoutInterval
            request.setValue(_CONTENT_TYPE, forHTTPHeaderField: contentType)
//            if apiName != API_LOGIN {
//                request.addValue("\(defaults.value(forKey: kTOKENTYPE) as! String) " + " \(defaults.value(forKey: kACCESSTOKEN) as! String)", forHTTPHeaderField: authorization)
//            }
            let jsonData = parameterDict.toData()
            request.httpBody = jsonData
            
            //MBProgressHUD.showAdded(to: (appdelegate.navController?.topViewController?.view!)!, animated: true)
            request.perform(hudType: hudType) { (responseObject: AnyObject?, error: Error?, httpResponse: HTTPURLResponse) in
                
                DispatchQueue.main.async(execute: {
                    //MBProgressHUD.hide(for: (appdelegate.navController?.topViewController?.view!)!, animated: true)
                    completionBlock(responseObject, error, httpResponse.statusCode)
                    
                })
            }
        case .patch: fallthrough
        case .delete: fallthrough
        default : print("Default handlation here")
            
            
        }
        
    }
}



extension URLRequest {
    
    func perform(hudType: loadingIndicatorType, completionBlock: @escaping (AnyObject?, Error?, HTTPURLResponse) -> Void) {
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        
        let task = session.dataTask(with: self, completionHandler: {
            data, response, error in
            
            do {
                if data != nil {
                    let result = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                   // print ("response json ==\(result)")
                    
                    let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    Debug.log("responseString = \(responseString!)")

                    
                    completionBlock(result as AnyObject?, error, response as! HTTPURLResponse)
                    
                } else {
                    if response != nil{
                        completionBlock(nil, error, response as! HTTPURLResponse)
                    }
                    
                }
            } catch {
                completionBlock(nil, error, response as! HTTPURLResponse)
            }
            
        })
        task.resume()
    }
    
    
}

extension Dictionary {
    func toData() -> Data {
        return try! JSONSerialization.data(withJSONObject: self, options: [])
    }
    
    func toJsonString() -> String {
        let jsonData = try! JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        return jsonString
    }
}



/// - returns:                Returns the mime type if successful. Returns application/octet-stream if unable to determine mime type.
extension URL {
    func mimeTypeForPath() -> String {
        let pathExtension = self.pathExtension
        
        print(" path extention  :\(pathExtension)")
        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
}


extension UIViewController {
    
   func showIndicator(withTitle title: String, and Description:String) {
      let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
      Indicator.label.text = title
      Indicator.isUserInteractionEnabled = false
      Indicator.detailsLabel.text = Description
      Indicator.show(animated: true)
   }
    
    func showBlankIndicator() {
       let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
       Indicator.label.text = ""
       Indicator.isUserInteractionEnabled = false
       Indicator.detailsLabel.text = ""
       Indicator.show(animated: true)
    }
    
   func hideIndicator() {
      MBProgressHUD.hide(for: self.view, animated: true)
   }
}

