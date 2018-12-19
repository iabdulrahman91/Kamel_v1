//
//  LoginModel.swift
//  Kamel_v1
//
//  Created by abdulrahman alanazi on 12/13/18.
//  Copyright © 2018 Halaworld. All rights reserved.
//

import UIKit

protocol LoginModelDelegate {
    func accountDownloaded(account: Account?)
}

class LoginModel: NSObject {
    var delegate:LoginModelDelegate?
    
    func getAccount(email: String){
        let serviceUrl = "http://halaworld.org/kamel/getAccountByEmail.php?email="+email
        
        let url = URL(string: serviceUrl)
        
        if let url = url {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let item:Account?
                    do{
                        item = try JSONDecoder().decode(Account.self, from: data!)
                    }
                    catch {
                        item =  Account()
                    }
//                    DispatchQueue.main.async {
                        self.delegate?.accountDownloaded(account: item)
//                    }
                } else {
                    // report error
                }
            }
            task.resume()
        }
    }
    
    
}
