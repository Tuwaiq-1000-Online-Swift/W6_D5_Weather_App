//
//  ViewController.swift
//  W6_D5_Weather_App
//
//  Created by يعرُب on 05/05/1443 AH.
//

import UIKit
import Alamofire

class MainVC: UIViewController {

    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    
    var cityId = "108410"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        editButton.layer.cornerRadius = 18
        NotificationCenter.default.addObserver(self, selector: #selector(cityChanged), name: NSNotification.Name(rawValue: "cityValueChanged"), object: nil)
//        NotificationCenter.default.addObserver(forName:
//
//                                                NSNotification.Name(rawValue: "cityValueChanged"), object: nil,)
        getCityWeatherInfo()
        
        
        
        
        
        
    }
    
    
    func getCityWeatherInfo(){
        let params = ["id" : cityId, "appid": "495375859304beffd9af4c94d66e02fc"]
        
        
        loaderActivityIndicator.startAnimating()
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: params, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
                let JSONDictionary = result as! NSDictionary
                let main = JSONDictionary["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                var pressure = main["pressure"] as! Double
                var humidity = main["humidity"] as! Double
                
                
                temp = temp - 272.15
                temp = Double(round(1000 * temp) / 1000)
                self.loaderActivityIndicator.stopAnimating()
                
                self.tempLabel.text = "\(temp)°"
                self.pressureLabel.text = "\(pressure)"
                self.humidityLabel.text = "\(humidity)"
            }
        }
    }
    
    
    
    @objc func cityChanged(notification: Notification){
        if let city = notification.userInfo?["city"] as? City {
            cityNameLabel.text = city.name
            cityId = city.id
            getCityWeatherInfo()
            
        }
    }


}

