//
//  ChangeCityVC.swift
//  W6_D5_Weather_App
//
//  Created by يعرُب on 05/05/1443 AH.
//

import UIKit

class ChangeCityVC: UIViewController {
    
    
    var citiesArray = [
        City(name: "الرياض", id: "108410"),
        City(name: "الدمام", id: "110336"),
        City(name: "جدة", id: "105343"),
        City(name: "أبها", id: "110690")
    ]
    
    
    
    /*
     Dammam => 110336
     Jeddah => 105343
     Abha => 110690
     */
    var selectedCity: City?
    
    @IBOutlet weak var citiesPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        citiesPickerView.delegate = self
        citiesPickerView.dataSource = self
    }
    
    @IBAction func editCityButtonClicked(_ sender: Any) {
        if let city = selectedCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil, userInfo: ["city": city])
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    

}

extension ChangeCityVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        citiesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return citiesArray[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = citiesArray[row]
    }
    
    
    
}
