//
//  ViewController.swift
//  A2209AtuoLayout
//
//  Created by 申潤五 on 2022/1/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDef = UserDefaults.standard
        let date = userDef.object(forKey: "lastInput")
        if let theDate = date as? Date {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy/MMMM/dd HH:mm"
            dateFormater.locale = Locale(identifier: "zh_Hant_TW")
            let dateString = dateFormater.string(from: theDate)
            displayLabel.text = dateString
        }else{
            displayLabel.text = ""
        }
    }

    @IBAction func selectDateAction(_ sender: UIDatePicker) {
        let theDate = sender.date
        let userDef = UserDefaults.standard
        userDef.set(theDate, forKey: "lastInput")
        userDef.synchronize()
        
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy/MMMM/dd HH:mm"
        dateFormater.locale = Locale(identifier: "zh_Hant_TW")
        let dateString = dateFormater.string(from: theDate)
        displayLabel.text = dateString
        
        
        
    }
    
}

