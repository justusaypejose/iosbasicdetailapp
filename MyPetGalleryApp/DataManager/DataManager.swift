//
//  DataManager.swift
//  MyPetGalleryApp
//
//  Created by Justus Aype Jose on 17/10/20.
//

import Foundation

class DataManager {
    var isDummyData: Bool = true
    static var shared = DataManager()
    private init(_ isDummyData: Bool = true) {
        self.isDummyData = isDummyData
    }
    func getPets() -> AllPetsVM? {
        guard let petData = self.fetchPetData() else { return nil }
        if let pets = petData.data(using: String.Encoding.utf8) {
            if let data = try? JSONDecoder().decode(AllPets.self, from: pets) {
                let allPets = AllPetsVM(pets: data)
                return allPets
            } else {
                return nil
            }
        }
        return nil
    }
    func fetchPetData(_ fromLocal: Bool = true) -> String? {
        if fromLocal == false {
            return "NOT-IMPLEMENTED-YET"
        } else {
            // In this case, use data from the txt file in JSON format 'PetJSON.txt'
            guard let filePath = Bundle.main.path(forResource: "PetJSON", ofType: "txt") else { return "" }
            let response = try? String(contentsOf: URL(fileURLWithPath: filePath))
            guard let responseValues = response else { return "" }
            return responseValues
        }
    }
}

