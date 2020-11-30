

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var swichLabel: UILabel!
    @IBOutlet var gorillaSwitch: UISwitch!
    
    var textArray = [String]()
    var imageArray = ["1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swichLabel.text = "Hurman Mode"
        gorillaSwitch.isOn = false
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return textArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //as!はダウンキャストの意味
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        let label = cell.contentView.viewWithTag(2) as! UILabel
        
        label.text = textArray[indexPath.row]
        imageView.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
        
    }
    
    @IBAction func tap(_ sender: Any) {
        
        if textArray.count > 5 || textField.text?.isEmpty == true{
            return
        }
        
        textArray.append(textField.text!)
        textField.text = ""
        //
        if textArray.count <= 5 {
            tableView.reloadData()
        }
        
    }

    @IBAction func chengeGorilla(_ sender: Any) {
        
        if gorillaSwitch.isOn{
            swichLabel.text = "Gorilla Mode"
        }else{
            swichLabel.text = "Hurman Mode"
        }
        
    }
    
}
