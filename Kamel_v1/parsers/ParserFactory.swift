//
//  ParserFactory.swift
//  kamel
//
//  Created by abdulrahman alanazi on 12/12/18.
//  Copyright © 2018 halaworld. All rights reserved.
//

import UIKit

class ParserFactory: NSObject {

    func getParser(dataType: String)->ParserProtocol?{
        if(dataType == "Companies"){
            return CompanyParser()
        } else if(dataType == "Types"){
            return TypeParser()
        } else {
            return nil
        }
    }
}
