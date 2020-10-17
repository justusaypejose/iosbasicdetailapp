//
//  ViewController.swift
//  MyPetGalleryApp
//
//  Created by Justus Aype Jose on 15/10/20.
//

import UIKit

class PetListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    var pets: AllPetsVM?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.delegate = self
        table.dataSource = self
        
        self.fetchPets()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pets?.pets.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell") as? PetListTableViewCell {
            if let age = self.pets?.pets[indexPath.row].age {
                cell.petAge.text = "Age (in years) : \(age) "
            }
            cell.petName.text = self.pets?.pets[indexPath.row].name
            cell.petImage.image = UIImage(named: self.pets?.pets[indexPath.row].imageName ?? "")
            return cell
        }
        return UITableViewCell()
    }
}

extension PetListViewController {
    private func fetchPets() {
        if let pets = DataManager.shared.getPets() {
            self.pets = pets
        }
    }
}

extension PetListViewController {
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "petdetail" {
            let petDetailViewController = segue.destination as? PetDetailViewController
            petDetailViewController?.age = self.pets?.pets[self.table.indexPathForSelectedRow?.row ?? 0].age
            petDetailViewController?.imageName = self.pets?.pets[self.table.indexPathForSelectedRow?.row ?? 0].imageName
            petDetailViewController?.name = self.pets?.pets[self.table.indexPathForSelectedRow?.row ?? 0].name
        }
    }
}
