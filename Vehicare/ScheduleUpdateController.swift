//
//  ScheduleUpdateController.swift
//  Vehicare
//
//  Created by Abhirama Rizkia Triadi on 28/04/22.
//

import UIKit

protocol passDateToHome: AnyObject{
    func passDate(stringDate : String)
}

class ScheduleUpdateController: UIViewController{
    
    // Outlet Label
    @IBOutlet weak var lastLabel: UILabel!
    @IBOutlet weak var lastDate: UILabel!
    @IBOutlet weak var nextDate: UILabel!
    
    @IBOutlet weak var datePicked: UITextField!
    
    weak var delegate:passDateToHome?
    var dateStringPass : String = ""
    
    @IBAction func submitButton(_ sender: Any) {
        dismiss(animated: true){
            self.delegate?.passDate(stringDate: self.dateStringPass)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        
        datePicked.inputView = datePicker
       
        datePicked.text = formatDate(date: Date()) // set to todays date
        
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        datePicked.text = formatDate(date: datePicker.date)
        let currentDate =  datePicker.date
        let modifiedDate = Calendar.current.date(byAdding: .month, value: 3, to: currentDate)!
        
        let modifiedDateStr = formatDate(date: modifiedDate)
        nextDate.text = modifiedDateStr
        dateStringPass = modifiedDateStr
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }

}


