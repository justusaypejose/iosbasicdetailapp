//
//  PetDetailViewController.swift
//  MyPetGalleryApp
//
//  Created by Justus Aype Jose on 18/10/20.
//

import UIKit

class PetDetailViewController: UIViewController {

    @IBOutlet weak var petAge: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petImage: UIImageView!

    var name: String?
    var age: Int?
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadElements()
    }
    private func loadElements() {
        if let age = self.age {
            self.petAge.text = "Age (in years) : \(age) "
        }
        self.petName.text = self.name
        self.petImage.image = UIImage(named: self.imageName ?? "")
    }
}
