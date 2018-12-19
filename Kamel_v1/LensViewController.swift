//
//  LensViewController.swift
//  Kamel_v1
//
//  Created by abdulrahman alanazi on 12/13/18.
//  Copyright © 2018 Halaworld. All rights reserved.
//

import UIKit

class LensViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var selectedMM:String?
    var names:[String]=[
    "18-55mm",
    "70-80mm",
    "70-300mm",
    "100-200mm"
    ]
    @IBOutlet weak var lensNameTextField: UITextField!
    @IBOutlet weak var namePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        namePicker.delegate = self
        namePicker.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        namePicker.reloadAllComponents()
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedMM = names[row]
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toDetails", sender: self)
    }
    


}
