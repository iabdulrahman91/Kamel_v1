//
//  GenericModel.swift
//  kamel
//
//  Created by abdulrahman alanazi on 12/12/18.
//  Copyright © 2018 halaworld. All rights reserved.
//

import UIKit
protocol GenericModelDelegate {
    func itemsDownloaded(items: [Any])
}
class GenericModel: NSObject {
    
    var delegate:GenericModelDelegate?
    var parser:ParserProtocol?
    

    func getTypes(item: String){
        // get parser
        parser = ParserFactory().getParser(dataType: item)
        
        let serviceUrl = "http://halaworld.org/kamel/get\(item).php"
        let url = URL(string: serviceUrl)
        
        if let url = url {
            // to disable caching the response
            let config = URLSessionConfiguration.default
            config.requestCachePolicy = .reloadIgnoringLocalCacheData
            config.urlCache = nil
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: url) {
                (data, response, error) in
                if error == nil {
                    let result = self.parser?.parseJson(data: data!)
                   
                    if result != nil {
                        
                        DispatchQueue.main.async {
                            self.delegate?.itemsDownloaded(items: result!)
                        }
                        
                        
                    } else {
                        print("parser returned nil")
                    }
                } else {
                    print("There is an error")
                }
            }
            
            task.resume()
        } else {
            print("probably URL issue")
        }
    }
}


