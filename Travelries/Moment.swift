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
    var date: NSDate?
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
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("moments")
    
    
    // MARK: Initialization
    
    init?(name: String, momentDescription: String, photo: UIImage?, locality: String?, country: String?, date: NSDate?, favorite: Bool) {
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
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(momentDescription, forKey: PropertyKey.momentDescriptionKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(locality, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(country, forKey: PropertyKey.countryKey)
        aCoder.encodeObject(date, forKey: PropertyKey.dateKey)
        aCoder.encodeBool(favorite, forKey: PropertyKey.favoriteKey)
    }
    
    
    required convenience init?(coder aCoder: NSCoder) {
        let name = aCoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let momentDescription = aCoder.decodeObjectForKey(PropertyKey.momentDescriptionKey) as! String
        let photo = aCoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let locality = aCoder.decodeObjectForKey(PropertyKey.localityKey) as? String
        let country = aCoder.decodeObjectForKey(PropertyKey.countryKey) as? String
        let date = aCoder.decodeObjectForKey(PropertyKey.dateKey) as? NSDate
        let favorite = aCoder.decodeBoolForKey(PropertyKey.favoriteKey)
        
        self.init(name: name, momentDescription: momentDescription, photo: photo, locality: locality, country: country, date: date, favorite: favorite)
    }
    
    
}