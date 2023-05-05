//
//  ViewController.swift
//  DemoCore
//
//  Created by West Agile labs on 01/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnShowClick(_ sender: Any) {
        //it is used to navigate all the person related data to the new viewcontroller
        let listVc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(listVc, animated: true)
    }
    
    
    @IBAction func btnSaveClick(_ sender: Any) {
        
        let dict = ["name": txtName.text, "address": txtAddress.text, "city": txtCity.text, "mobile": txtMobile.text]
        DatabaseHelper.shareInstance.save(object: dict as! [String: String])
        
    }
    
}

