//
//  AddEditViewController.swift
//  ESG-ZenGrove
//
//  Created by De Azevedo Santos, Guilherme on 08/03/24.
//

import UIKit

class AddEditViewController: UIViewController {

    var esg: ESG?
    
    @IBOutlet weak var pontuationTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let esg = esg{
            titleTextField.text = esg.title
            typeTextField.text = esg.type
            pontuationTextField.text = esg.title
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func AddEditESG(_ sender: Any) {
        
        if esg === nil{
            esg = ESG(context: context)
        }
        
        esg?.title = titleTextField.text
        esg?.type = typeTextField.text
        esg?.pontuation = pontuationTextField.text
        
        do {
            try context.save()
            
             navigationController?.popViewController(animated: true)
        }catch{
            print(error.localizedDescription)
        }
        
    }
  

}
