//
//  DetailsViewController.swift
//  Kamel_v1
//
//  Created by abdulrahman alanazi on 12/13/18.
//  Copyright © 2018 Halaworld. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate , UITextFieldDelegate{
    

    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    @IBOutlet weak var city: UIPickerView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var priceLabel: UILabel!
    
    var cities:[String] = [
    "Jubail",
    "Hail",
    "Bqaig",
    "Dammam",
    "Riyadh"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        city.dataSource = self
        city.delegate = self
        
        city.reloadAllComponents()
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // TODO
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        priceLabel.text = "$\(priceTextField.text) /day"
    }
    


}
