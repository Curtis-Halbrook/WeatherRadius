//
//  Datastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

protocol Datastore : Actor {
    
    /**
     Save a value associated with the given key in the Datastore
     
     - parameters:
         - value: The thing to store.  Must conform to Codable
         - key: A unique token used to reference the value
     */
    func save<T: Codable>(value: T, key: String)
    
    /**
     Gets a value associated with the given key in the Datastore
     
     - parameters:
         - key: A unique token used to reference the value
     
     - returns:
     The value if it exists and is type T; nil otherwise
    */
    func get<T: Codable>(key: String) -> T?
    
    /**
     Gets all of the current keys for the given Datastore
     
     - returns:
     A [String] containing all of the current keys stored.
     */
    func getKeys() -> [String]
        
    /**
     Removes the value associated with the given key in the Datastore
     
     - parameters:
         - key: A unique token used to reference the value
     */
    func remove(key: String)
    
    /**
     Removes all of the values in the Datastore.
     */
    func flush()
    
}
