//
//  MemoryDatastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

actor MemoryDatastore: Datastore {
    
    init() {
        self.dictionary = [:]
    }
    
    func save<T: Codable>(value: T, key: String) {
        dictionary[key] = value
    }
    
    func get<T: Codable>(key: String) -> T? {
        return dictionary[key] as? T
    }
    
    func getKeys() -> [String] {
        return Array(dictionary.keys)
    }
    
    func remove(key: String) {
        dictionary.removeValue(forKey: key)
    }
    
    func flush() {
        dictionary.removeAll()
    }

    private var dictionary: [String : Codable]
}
