//
//  ViewController.swift
//  Vehicare
//
//  Created by Abhirama Rizkia Triadi on 27/04/22.
//

import UIKit


class ViewController: UIViewController, passDateToHome{
   
    

    @IBOutlet weak var vehicleCard: UIImageView!
    @IBOutlet weak var NeedsTableView: UITableView!
    
    var flag : Int = 0
    var vehicleNeeds : [Needs] = []
    
    let motorCard : UIImage = UIImage(named: "Vehicle Card.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vehicleCard.image = motorCard
        vehicleNeeds = createArray()

        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Needs]{
        var tempArray : [Needs] = []
        
        let needs1 = Needs(desc : "Service Schedule", last : "Last on : 24/04/2022", next : "24/07/2022")
        let needs2 = Needs(desc : "Oil Change", last : "Last on : 24/04/2022", next : "24/07/2022")
        let needs3 = Needs(desc : "Tire Change", last : "Last on : 24/04/2022", next : "24/07/2022")
        let needs4 = Needs(desc : "Tax Payment", last : "Last on : 24/04/2022", next : "24/07/2022")
        
        tempArray.append(needs1)
        tempArray.append(needs2)
        tempArray.append(needs3)
        tempArray.append(needs4)
        
        return tempArray
    }

    func passDate(stringDate: String) {
        vehicleNeeds[flag].next = stringDate
        NeedsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServiceUpdate" {
            let vc = segue.destination as? ScheduleUpdateController
            vc?.delegate = self
        }
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleNeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let needs = vehicleNeeds[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NeedsCell") as! NeedsTableViewCell
        
        cell.setNeeds(needs: needs)
        
        //agar tau label keberapa
        cell.nextdateNeeds.tag = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.flag = indexPath.row
        performSegue(withIdentifier: "ServiceUpdate", sender: self)
    }
   
   
}

