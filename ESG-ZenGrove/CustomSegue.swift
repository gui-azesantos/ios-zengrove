//
//  CustomSegue.swift
//  ESG-ZenGrove
//
//  Created by De Azevedo Santos, Guilherme on 15/03/24.
//

import UIKit

class CustomSegue: UIStoryboardSegue {

    override func perform() {
           // Implemente a lógica da transição aqui
           // Por exemplo, apresentando a view controller de destino
           source.present(destination, animated: true, completion: nil)
       }
    
}
