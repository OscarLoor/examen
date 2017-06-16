//
//  mostrarInformacionController.swift
//  examen
//
//  Created by Oscar on 16/6/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

import UIKit
import FirebaseDatabase

class mostrarInformacionController: UIViewController {
    var pokemon: Pokemon?
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagenPrincipal: UIImageView!
    @IBAction func guardarDato(_ sender: UIButton) {
        print("Guardando")
        if let pokemon = pokemon {
            print( pokemon.nombre)
            print( pokemon.urlImagen)
            
            var ref: DatabaseReference!
            
            ref = Database.database().reference().childByAutoId()
            ref.setValue(["nombre": pokemon.nombre, "imagen": pokemon.urlImagen])
            

        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if let pokemon = pokemon {
            nombre.text = pokemon.nombre
            imagenPrincipal.image = pokemon.imagenPrincipal
        }
        // Enable the Save button only if the text field has a valid Meal name.
        //updateSaveButtonState()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
