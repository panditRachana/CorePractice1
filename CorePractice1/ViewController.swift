//
//  ViewController.swift
//  CorePractice1
//
//  Created by Rachana Pandit on 21/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtFirstName:UITextField!
    @IBOutlet weak var txtLastName:UITextField!
    @IBOutlet weak var txtempId:UITextField!
    let coreHelper = CoreDataHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coreHelper.retriveData()
    }
    
    
    @IBAction func btnAddClick(_ sender:Any)
    {
        if (txtempId.text!.isEmpty ||
            txtFirstName.text!.isEmpty || txtLastName.text!.isEmpty)
        {
            let alert = UIAlertController(title: "Message", message: "Enter all values", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Message", message: "Submit data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                
                self.coreHelper.insertData(id: Int16(self.txtempId.text!)!, firstName: self.txtFirstName.text!, lastName: self.txtLastName.text!)
                
                self.txtempId.text = ""
                self.txtFirstName.text = ""
                self.txtLastName.text = ""
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
}

