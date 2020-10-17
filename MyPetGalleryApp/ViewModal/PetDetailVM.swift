//
//  PetDetailVM.swift
//  MyPetGalleryApp
//
//  Created by Justus Aype Jose on 17/10/20.
//

import Foundation

class AllPetsVM {
    var pets: [PetDetailVM]
    init(pets: AllPets) {
        self.pets = [PetDetailVM]()
        for each in pets.pets {
            let eachPet = PetDetailVM(name: each.name ?? "", age: each.age ?? 0, imageName: each.id ?? "")
            self.pets.append(eachPet)
        }
    }
}

class PetDetailVM {
    var name: String?
    var age: Int?
    var imageName: String?
    init(name: String, age: Int, imageName: String) {
        self.name = name
        self.age = age
        self.imageName = "pet\(imageName).png"
    }
}
