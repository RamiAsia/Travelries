//
//  Moment.swift
//  Travelries
//
//  Created by Rami on 9/20/16.
//  Copyright © 2016 Rami. All rights reserved.
//

import UIKit


class Moment: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String
    var momentDescription: String
    var photo: UIImage?
    var locality: String?
    var country: String?
    var date: Date?
    var favorite: Bool
    
    
    // MARK: Property Keys
    
    struct PropertyKey {
        static let nameKey = "name"
        static let momentDescriptionKey = "momentDescription"
        static let photoKey = "photo"
        static let localityKey = "locality"
        static let countryKey = "country"
        static let dateKey = "date"
        static let favoriteKey = "favorite"
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("moments")
    
    
    // MARK: Initialization
    
    init?(name: String, momentDescription: String, photo: UIImage?, locality: String?, country: String?, date: Date?, favorite: Bool) {
        self.name = name
        self.momentDescription = momentDescription
        self.photo = photo
        self.locality = locality
        self.country = country
        self.date = date
        self.favorite = favorite
        
        super.init()
        
        // If the name or description is empty, don't return an object. They must be filled.
        if name.isEmpty || momentDescription.isEmpty {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(momentDescription, forKey: PropertyKey.momentDescriptionKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(locality, forKey: PropertyKey.localityKey)
        aCoder.encode(country, forKey: PropertyKey.countryKey)
        aCoder.encode(date, forKey: PropertyKey.dateKey)
        aCoder.encode(favorite, forKey: PropertyKey.favoriteKey)
    }
    
    
    required convenience init?(coder aCoder: NSCoder) {
        let name = aCoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let momentDescription = aCoder.decodeObject(forKey: PropertyKey.momentDescriptionKey) as! String
        let photo = aCoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage
        let locality = aCoder.decodeObject(forKey: PropertyKey.localityKey) as? String
        let country = aCoder.decodeObject(forKey: PropertyKey.countryKey) as? String
        let date = aCoder.decodeObject(forKey: PropertyKey.dateKey) as? Date
        let favorite = aCoder.decodeBool(forKey: PropertyKey.favoriteKey)
        
        self.init(name: name, momentDescription: momentDescription, photo: photo, locality: locality, country: country, date: date, favorite: favorite)
    }
    
    
}
