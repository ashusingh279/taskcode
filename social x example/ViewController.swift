//
//  ViewController.swift
//  social x example
//
//  Created by admin on 15/08/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var breifDescCardView: UIView!
    @IBOutlet weak var eventLocationCardView: UIView!
    @IBOutlet weak var promoteEventtBttnt: UIButton!
    @IBOutlet weak var addTickkettBbttn: UIButton!
    @IBOutlet weak var overViewCardView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var likeViewHeadingView: UIView!
     var titlearray = ["View event orgaanizer","View event sponsers","View event performers","View seating plan"]
      var presenceArray = [PresenceModal]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.callWebServiceForDetails()
           promoteEventtBttnt.layer.cornerRadius = 10
           addTickkettBbttn.layer.cornerRadius = 10
           likeViewHeadingView.layer.cornerRadius = 10
           likeViewHeadingView.layer.borderWidth = 1
           likeViewHeadingView.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
           overViewCardView.layer.cornerRadius = 10
           breifDescCardView.layer.cornerRadius = 10
           eventLocationCardView.layer.cornerRadius = 10
        
        let obj1 = PresenceModal()
                     obj1.ofcType = "Corporate Office"
                     obj1.ofcIsExpand = false
                     
                     let insideObj1 = PresenceAddressModal()
                     insideObj1.ofcAddress = ""
                     obj1.ofcAddress.append(contentsOf:[insideObj1,insideObj1,insideObj1])
                     
                     
                     let obj2 = PresenceModal()
                     obj2.ofcType = ""
                     obj2.ofcIsExpand = false
                     
                     let insideObj2 = PresenceAddressModal()
                     insideObj2.ofcAddress = ""
                     obj2.ofcAddress.append(contentsOf:[insideObj2,insideObj2,insideObj2])
                     
                     let obj3 = PresenceModal()
                     obj3.ofcType = ""
                     obj3.ofcIsExpand = false
                     
                     let insideObj3 = PresenceAddressModal()
                     insideObj3.ofcAddress = ""
                     obj3.ofcAddress.append(contentsOf:[insideObj3,insideObj3,insideObj3])
                    let obj4 = PresenceModal()
                    obj4.ofcType = ""
                    obj1.ofcIsExpand = false
                    
                    let insideObj4 = PresenceAddressModal()
                    insideObj4.ofcAddress = ""
                    obj1.ofcAddress.append(contentsOf:[insideObj4,insideObj4,insideObj4])
                     
              presenceArray.append(contentsOf: [obj1,obj2,obj3,obj4])
           //   tableView.reloadData()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func goToBackScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}




extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                  return 95
        
              }
              
              func numberOfSections(in tableView: UITableView) -> Int {
                  
                  return presenceArray.count
                  
              }
      
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           let objinside = presenceArray[section]
                      if objinside.ofcIsExpand {
                          
                          return 1//objinside.ofcAddress.count
                      }else{
                          return 0
                      }
        }
       

       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           
           let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerReviewsTCell") as! headerReviewsTCell
           
           headerCell.btnHeader.tag = section + 100
           headerCell.btnHeader.addTarget(self, action: #selector(self.btnHeaderClick(sender:)), for: .touchUpInside)
            headerCell.titleLbl.text = titlearray[section]
           
           let objinside = presenceArray[section]
           if objinside.ofcIsExpand{
               headerCell.lefticonimageView.isHidden = true
               headerCell.downiconimageView.isHidden = false
           }
           else {
               
                 headerCell.downiconimageView.isHidden = true
               headerCell.lefticonimageView.isHidden = false
           }
                   
           return headerCell
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           
           if indexPath.section == 0 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpanedTCell", for: indexPath) as! ExpanedTCell
                      
               
                        return cell
                        }
                    if indexPath.section == 1 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpanedTCell", for: indexPath) as! ExpanedTCell
                       
                        
                      return cell
                       
                    }
                    if indexPath.section == 2 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpanedTCell", for: indexPath) as! ExpanedTCell
                           return cell
                               }
                    if indexPath.section == 3 {
                        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpanedTCell", for: indexPath) as! ExpanedTCell
                          
                        return cell
                            }
                    return UITableViewCell()
          
       }
       
       @objc func btnHeaderClick(sender:UIButton!){
                let obj = presenceArray[sender.tag - 100]
                obj.ofcIsExpand = !obj.ofcIsExpand
                self.tableView.reloadData()
                  
              }
}
    extension ViewController {

     func callWebServiceForDetails() {

      //  var params = [String:Any]()

//        params["latitude"] = 28.1245
//        params["longitude"] = 78.1245
//        params["event_id"] = 12
//        params["User_id"] = 00
        
        let params = [
                    "latitude" : "28.1245",
                    "longitude" : "78.1245",
                    "event_id" : "12",
                    "User_id" : "0"
         
        ]
                             
           self.showBlankIndicator()
              
           ServiceHelper.request(params, method: .post, apiName: API_ALL_DETAILS, hudType: .simple) { (result, error, code) in
               self.hideIndicator()
               if result == nil{  _ = AlertController.alert(title: "", message: "Something went wrong.");return}

               let responseDict = result as! [String:Any]
               let error = responseDict.validatedValue("error", expected: 0 as AnyObject) as! Bool
               let responseCode = responseDict.validatedValue("error_code", expected: 0 as AnyObject) as! Int
            
               let responseMessagefromServer = responseDict.validatedValue("message", expected: "" as AnyObject) as! String

               if responseCode == 100{

               Debug.log(" details ==\(responseDict)")
             
                let data = responseDict.validatedValue("data", expected: [:] as AnyObject) as! [String : Any]

                let startDate = data.validatedValue("ev_start_date", expected: "" as AnyObject) as? String
                 let endDate = data.validatedValue("ev_end_date", expected: "" as AnyObject) as? String
               let startTime = data.validatedValue("ev_start_time", expected: "" as AnyObject) as? String
               let endTime = data.validatedValue("ev_end_time", expected: "" as AnyObject) as? String
                                                
                self.dateLbl.text = startDate! + "-" + endDate!
                self.timeLbl.text = startTime! + "-" + endTime!
               }

               else
                 {
                   _ = AlertController.alert(title: "", message: responseMessagefromServer)
               }
           }
       }
            
}
class PresenceModal: NSObject {

    var ofcType = ""
    var ofcIsExpand:Bool = false
    var ofcAddress = [PresenceAddressModal]()
    
}

class PresenceAddressModal: NSObject {

    var ofcAddress = ""
    var ofcName = ""
    
    
}
