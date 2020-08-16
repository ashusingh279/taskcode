//
//  Constants.swift
//  AssertPlayApp
//
//  Created by Pawan Joshi on 11/12/18.
//  Copyright © 2019 Pawan Joshi. All rights reserved.
//
// firebase Account - becommere@gmail.com

import Foundation
import UIKit


@available(iOS 13.0, *)
struct Constants {
    var APPDELEGATE = UIApplication.shared.delegate as! AppDelegate
    struct Device {
        // iDevice detection code
        static let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
        static let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
        static let IS_RETINA = UIScreen.main.scale >= 2.0
        
        static let SCREEN_WIDTH = Int(UIScreen.main.bounds.size.width)
        static let SCREEN_HEIGHT = Int(UIScreen.main.bounds.size.height)
        static let SCREEN_MAX_LENGTH = Int(max(SCREEN_WIDTH, SCREEN_HEIGHT))
        static let SCREEN_MIN_LENGTH = Int(min(SCREEN_WIDTH, SCREEN_HEIGHT))
        
        static let IS_IPHONE_4_OR_LESS = IS_IPHONE && SCREEN_MAX_LENGTH < 568
        static let IS_IPAD_OR_LESS = SCREEN_MAX_LENGTH < 568
        static let IS_IPHONE_5 = IS_IPHONE && SCREEN_MAX_LENGTH == 568
        static let IS_IPHONE_6 = IS_IPHONE && SCREEN_MAX_LENGTH == 667
        static let IS_IPHONE_6P = IS_IPHONE && SCREEN_MAX_LENGTH == 736
        static let IS_IPHONE_X = IS_IPHONE && SCREEN_MAX_LENGTH == 812
    }
    
    // MARK: AlertTitleMessages
    
    struct AlertActionTitles {
        static let alertActionTrue = "Yes"
        static let alertActionFalse = "No"
        static let alertActionDelete = "Delete"
        static let alertActionFlag = "Flag"
        static let alertActionEdit = "Edit"
        static let alertActionCancel = "Cancel"
        static let alertActionReport = "Report"
        static let alertContactAdmin = "Contact Admin"
        static let alertActionUnfollow = "Unfollow"
        static let alertReportChat = "Report User"
    }
  
    // MARK: Tokens
    
    struct NotificationNames {
        static let reloadCustomerOrderListNotificaitonName: Notification.Name = Notification.Name(rawValue: "reloadCustomerOrderListNotification")
        static let reloadStylistOrderListNotificaitonName: Notification.Name = Notification.Name(rawValue: "reloadStylistOrderListNotification")
        static let reloadFeedListNotificaitonName: Notification.Name = Notification.Name(rawValue: "reloadFeedListNotification")
        static let reloadProductListNotificaitonName: Notification.Name = Notification.Name(rawValue: "reloadProductListNotification")
        static let reloadCardListNotificaitonName: Notification.Name = Notification.Name(rawValue: "reloadCardListNotification")
        static let showNotificationListNotificaitonName: Notification.Name = Notification.Name(rawValue: "showNotificationListNotification")
    }
    
    // MARK: ErrorMessages
    
    
}

func RGBA(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: a)
}

//MARK:- WebService API constants
// Common Message using in app

let _INTERNET_CONNECTION_CHECK  =  "Please check your internet connection!"
let _ERROR_MESSAGE_TITLE  =  "ERROR!"


let _CONTENT_TYPE = "application/json"
let _GET_METHOD = "GET"
let _POST_METHOD = "POST"
let _PUT_METHOD = "PUT"

//Objects
@available(iOS 13.0, *)
let appdelegate = UIApplication.shared.delegate as! AppDelegate
let defaults = UserDefaults.standard

let DEVELOPMENT_WEBSERVICES_BASEURL = "http://saudicalendar.com/api/"

// Autherization
let username = "admin"
let password = "admin"
let loginData = String(format: "%@:%@", username, password).data(using: String.Encoding.utf8)!
let _AUTHERIZATION_CONTENT = loginData.base64EncodedString()

// api name



let API_ALL_DETAILS                      = "user/getEventDetail"

 
let notificationCenter = NotificationCenter.default


let  _COUNTRY_CODE = "+91" // Set UK code before release to client +44.
let _DEVICE_TYPE = "iOS"


let _SUCCESS_RESPONSE_CODE = 200
let _USER_NAME            = "UserName"
let _USER_PASSWORD        = "Password"
