//
//  CompaniesViewController.swift
//  kamel
//
//  Created by abdulrahman alanazi on 12/12/18.
//  Copyright © 2018 halaworld. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GenericModelDelegate {


    @IBOutlet weak var listTableView: UITableView!
    
    var model:GenericModel = GenericModel()
    var selectedItem:Any?
    var feedItems:[Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.model.delegate = self
        self.model.getTypes(item: "Companies")
        // Do any additional setup after loading the view.
    }
    
   
    // MARK: - protocal stubs
    func itemsDownloaded(items: [Any]) {
        feedItems = items as! [Company]
        listTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let num = feedItems?.count {
            return num
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        let item = feedItems?[indexPath.row] as! Company
        cell.textLabel!.text = item.cName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = feedItems?[indexPath.row] as! Company
        self.performSegue(withIdentifier: "toTypes", sender: self)
    }
    
}
