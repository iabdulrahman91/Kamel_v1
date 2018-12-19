//
//  ParserProtocol.swift
//  kamel
//
//  Created by abdulrahman alanazi on 12/12/18.
//  Copyright © 2018 halaworld. All rights reserved.
//

import Foundation
protocol ParserProtocol {
    func parseJson(data: Data) -> [Any]?
}
