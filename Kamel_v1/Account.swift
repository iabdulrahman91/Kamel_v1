//
//  Account.swift
//  Kamel_v1
//
//  Created by abdulrahman alanazi on 12/13/18.
//  Copyright © 2018 Halaworld. All rights reserved.
//

import Foundation
struct Account: Decodable {
    var accountID:Int? = nil
    var fName:String? = nil
    var lName:String? = nil
    var email:String? = nil
    var password:String? = nil
    var balance:Double? = nil
}
