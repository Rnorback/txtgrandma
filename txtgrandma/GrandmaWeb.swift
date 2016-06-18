//
//  GrandmaWeb.swift
//  txtgrandma
//
//  Created by Rob Norback on 6/17/16.
//  Copyright © 2016 Sidecar Games. All rights reserved.
//

import Foundation
import Alamofire

class GrandmaWeb {
    static var grandmaLevel = 5
    
    class func sendTextTo(phone:String,completion:()->Void, errorBlock: (NSError)->Void) {
        let now = Int(NSDate().timeIntervalSince1970 * 1000)
        let urlString = "http://104.131.149.139:40000/send_message?sender=Aaron&sender_phone_number=123456778&grandma=Granny&grandma_phone_number=7205879411&last_message_date=\(now)&grandma_level=\(grandmaLevel)"
        let params:[String:String] = [:]

        if grandmaLevel > 0 {
            grandmaLevel -= 1
        }
        
        Alamofire.request(.POST, urlString, encoding: .URL, parameters: params)
            .validate()
            .responseJSON { response in
                completion()
        }
    }
    
}