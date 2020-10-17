//
//  Pet.swift
//  MyPetGalleryApp
//
//  Created by Justus Aype Jose on 17/10/20.
//

import Foundation

class Pet: Codable, Identifiable {
    var name: String?
    var age: Int?
    var id: String?

    enum CodingKeys: String, CodingKey {
        case name
        case age
        case id = "tag"
    }
}
