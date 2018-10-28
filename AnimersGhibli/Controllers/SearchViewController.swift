//
//  SearchViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 17/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    let store = DataStore.sharedInstance
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        DataStore().savePeople { (p) in
            self.store.peopleDTO = p
            self.tableView.reloadData()
            }
        DataStore().saveSpecie { (s) in
            self.store.specieDTO = s!
            self.tableView.reloadData()
        }
        
        
        
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.peopleDTO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = store.peopleDTO[indexPath.row].name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsCell", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detailsCell"){
            let vc = segue.destination as! CharacteristicsPeopleViewController
            let currentRow = sender as! Int
            vc.nameCharacter = store.peopleDTO[currentRow].name
            vc.ageCharacter = store.peopleDTO[currentRow].age
            vc.eyeCharacter = store.peopleDTO[currentRow].eye
            vc.genderCharacter = store.peopleDTO[currentRow].gender
            vc.hairCharacter = store.peopleDTO[currentRow].hairColor
            vc.specieCharacter = store.peopleDTO[currentRow].species
        }

    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Characters"
    }
    
}


