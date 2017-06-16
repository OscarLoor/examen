//
//  PokemonTableViewController.swift
//  examen
//
//  Created by Oscar on 16/6/17.
//  Copyright © 2017 Oscar. All rights reserved.
//

import UIKit
import os.log

class PokemonTableViewController: UITableViewController {

    //MARK: Properties
    
    var pokemones = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        print("Entro en table view")
        cargarEjemploDePokemones()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Configure the cell...
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "celdaPropiaTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? celdaPropiaTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // Fetches the appropriate meal for the data source layout.
        let pokemon = pokemones[indexPath.row]
        
        cell.tituloLabel.text = pokemon.nombre
        cell.imagenPrincipal.image = pokemon.imagenPrincipal
        

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Private Methods
    
    private func cargarEjemploDePokemones() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let pokemon1 = Pokemon(nombre: "Charmander", imagenPrincipal: photo1) else {
            fatalError("No se puede crear pokemon1")
        }
        
        guard let pokemon2 = Pokemon(nombre: "Pikachu", imagenPrincipal: photo2) else {
            fatalError("No se puede crear pokemon2")
        }
        
        guard let pokemon3 = Pokemon(nombre: "Ditto", imagenPrincipal: photo3) else {
            fatalError("No se puede crear pokemon3")
        }
        
        pokemones += [pokemon1, pokemon2, pokemon3]
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
            
        case "mostrarDetalle":
            guard let mostrarInformacionController = segue.destination as? mostrarInformacionController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let celdaSeleccionada = sender as? celdaPropiaTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: celdaSeleccionada) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let pokemonSeleccionado = pokemones[indexPath.row]
            mostrarInformacionController.pokemon = pokemonSeleccionado
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }

}
