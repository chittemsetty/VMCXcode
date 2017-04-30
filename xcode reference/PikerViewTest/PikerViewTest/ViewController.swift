//
//  ViewController.swift
//  PikerViewTest
//
//  Created by Venu Chittemsetty on 12/6/15.
//  Copyright © 2015 Vedya Wonders. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate , UIPickerViewDataSource {

    @IBOutlet weak var pickedText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let data1 = ["Venu","Jyothi","Rithwik","Sahasra"]
    let data = [["Venu","Jyothi","Rithwik","Sahasra"],["Murali","Pushpalatha","Saidaiah","Lalitha"]]

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      //  return data [component][row]
        return data1 [row]
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    //    return data.count
        return 1
    }
   func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //    return data [component].count
         return data1.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
     //   self.pickedText.text = data[component][row]
         self.pickedText.text = data1[row]
    }

}

