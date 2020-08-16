//
//  DateFormatter.swift
//  HRMS
//
//  Created by Rajnarayan kumar on 6/10/19.
//  Copyright © 2019 Rajnarayan kumar. All rights reserved.
//


import UIKit

open class DateFormater{
    
    
open class func getDateFormattedInRequiredFormat(dateInString:String , currentdateFormat:String, requiredDateFormat:String) -> String {
        
           if dateInString.count > 0{
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = currentdateFormat
            dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            let date = dateFormatter.date(from: dateInString)
            dateFormatter.dateFormat = requiredDateFormat
            let datestr = dateFormatter.string(from: date!)
            return datestr
                    
           }else{
            
             return dateInString
           }
            
        }
    
    open class func getDateINStringFormatted (dateInString : String)-> String{
         if dateInString.count > 0{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone

        let date = dateFormatter.date(from: dateInString)
            
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        let datestr = dateFormatter.string(from: date!)
        return datestr
         }else{
             return ""
        }
            
           /* let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "dd-mm-yyyy"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd,yyyy"
            
            if let date = dateFormatterGet.date(from: dateInString) {
                print(dateFormatterPrint.string(from: date))
            } else {
                print("There was an error decoding the string")
            }
            
        }
        return ""*/
    }
    
    open class func getDateINStringWithSpecificFormat (dateInString : String)-> String{
         if dateInString.count > 0{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        let date = dateFormatter.date(from: dateInString)
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let datestr = dateFormatter.string(from: date!)
        return datestr
         }else{
            return ""
        }
    }
    
    
    
    
    
    
    open class func getDateINStringWithSpecificFormatWithoutZone (dateInString : String)-> Date{
        
        if dateInString.count > 0{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        let date = dateFormatter.date(from: dateInString)
        //dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +ssss"
       // return   dateFormatter.date(from: dateInString)!
//            let datestr = dateFormatter.string(from: date!)
            return date!
//
        }else{
            return Date()
        }
    }
    
    
    open class func getDateINStringwithDateOnly (dateInString : String)-> String{
        if dateInString.count > 0{
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd 00:00:00"
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        
        let date = dateFormatter.date(from: dateInString)
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        let datestr = dateFormatter.string(from:
            date!)
        return datestr
        }else{
            return ""
            
        }
    }
    
    open class func getDateINStringwithDateOnlyYYYYMMDD (dateInString : String)-> String{
        if dateInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, YYYY"
            dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            
            let date = dateFormatter.date(from: dateInString)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let datestr = dateFormatter.string(from:
                date!)
            return datestr
        }else{
            return ""
            
        }
    }
    
   
     open class func getDateINStringWithSpecificFormatWithoutZoneInDate (dateInString : String)-> Date{
            
            if dateInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            //dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            
            let date = dateFormatter.date(from: dateInString)
            //dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss +ssss"
           // return   dateFormatter.date(from: dateInString)!
    //            let datestr = dateFormatter.string(from: date!)
                return date!
    //
            }else{
                return Date()
            }
        }
    
    
    open class func getDateINStringwithMonthsFirst (dateInString : String)-> String{
        if dateInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            
            let date = dateFormatter.date(from: dateInString)
            dateFormatter.dateFormat = "MMM dd, yyyy"
            let datestr = dateFormatter.string(from:
                date!)
            return datestr
        }else{
            return ""
            
        }
    }
    
    
    
    
    open class func getTimeFromDateINStringwithMonthsFirst (dateInString : String)-> String{
        if dateInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            
            let date = dateFormatter.date(from: dateInString)
            dateFormatter.dateFormat = "hh:mm a"
            let datestr = dateFormatter.string(from:
                date!)
            return datestr
        }else{
            return ""
            
        }
    }
    
     open class func getDateINStringwithDate (dateInString : Date)-> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        let todayDate = dateFormatter.string(from: dateInString)
        
        return todayDate
    }
    open class func getDateINStringwithMMMMDDYYYY (dateInString : Date)-> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYYY"
        
        let todayDate = dateFormatter.string(from: dateInString)
        
        return todayDate
    }
    
    open class func getDateINStringwithMMYYYY (dateInString : Date)-> String{
              
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "MMM yyyy"
              
              let todayDate = dateFormatter.string(from: dateInString)
              
              return todayDate
          }
    
    
    
    open class func getDateINStringwithDDMMYYY (dateInString : Date)-> String{
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
           
           let todayDate = dateFormatter.string(from: dateInString)
           
           return todayDate
       }
    
    open class func getDateINStringwithDDMMYYYMood (dateInString : Date)-> String{
              
              let dateFormatter = DateFormatter()
              dateFormatter.dateFormat = "EEE MMM dd yyyy"
              
              let todayDate = dateFormatter.string(from: dateInString)
              
              return todayDate
          }
    
    open class func getDateINFormattedStringwithMMMMDDYYYY (dateInString : String)-> String{
        
        if dateInString.count > 0{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            
            let date = dateFormatter.date(from: dateInString)
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            let datestr = dateFormatter.string(from:
                date!)
            return datestr
        }else{
            return ""
            
        }
        
    }
    
    
    open class func getTimeINFormatted (timeInString : String)-> String{
        
        if timeInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            let date = dateFormatter.date(from: timeInString)
            
            dateFormatter.dateFormat = "HH:mm:ss"
            let date24 = dateFormatter.string(from: date!)
          
            return date24
            
        }else{
            return ""
        }
    }
    
    open class func getTimeINAMPMFormatted (timeInString : String)-> String{
        
        if timeInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            let date = dateFormatter.date(from: timeInString)
            
            dateFormatter.dateFormat = "hh:mm a"
            let timeInAMPM = dateFormatter.string(from: date!)
            
            return timeInAMPM
            
        }else{
            return ""
        }
    }
  
    open class func getTimeinDateFormat (timeInString : String)-> Date{
        
        if timeInString.count > 0{
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            let date = dateFormatter.date(from: timeInString)
            return date!
        }
        return Date()
    }
    
    open class func getTimeinDateFormatINAMPM (timeInString : Date)-> String{
           
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm a"
                          
                          let timeInAMPM = dateFormatter.string(from: timeInString)
                          return timeInAMPM
                     
                
         
       }
    
    
    
    open class func getTimeInRequiredFormat (timeInString : String)-> String{
        
        if timeInString.count > 0{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            // dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
            
            let date = dateFormatter.date(from: timeInString)
            dateFormatter.dateFormat = "HH:mm"
            let datestr = dateFormatter.string(from: date!)
            return datestr
            
        }else{
            return ""
        }
    }
    
  
}

