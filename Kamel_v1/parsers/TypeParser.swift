//
//  TypeParser.swift
//  kamel
//
//  Created by abdulrahman alanazi on 12/12/18.
//  Copyright © 2018 halaworld. All rights reserved.
//

import UIKit

class TypeParser: ParserProtocol {
    func parseJson(data: Data) -> [Any]?{
        do{
            let items = try JSONDecoder().decode([Type].self, from: data)
            return items
        }
        catch {
            return nil
        }
    }
}
