//
//  Pokemon.swift
//  examen
//
//  Created by Oscar on 16/6/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

import UIKit

class Pokemon {
    //MARK: Properties
    
    var nombre: String
    var imagenPrincipal: UIImage?
    
    //MARK: Initialization
    
    init?(nombre: String, imagenPrincipal: UIImage?) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if nombre.isEmpty{
            return nil
        }
        // Initialize stored properties.
        self.nombre = nombre
        self.imagenPrincipal = imagenPrincipal
        
    }
    
   
    
}

