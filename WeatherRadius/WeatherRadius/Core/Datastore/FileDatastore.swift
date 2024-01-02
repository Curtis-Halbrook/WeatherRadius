//
//  FileDatastore.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

actor FileDatastore : Datastore {
        
    init(purpose: String = "") {
        self.purpose = purpose
        self.fileManager = FileManager.default
        self.baseUrl = URL
            .applicationSupportDirectory
            .appendingPathComponent("file-datastore")
            .appendingPathComponent(self.purpose)
        
        try? FileManager.default.createDirectory(
            at: self.baseUrl,
            withIntermediateDirectories: true
        )
    }
    
    func save<T: Codable>(value: T, key: String) {
        do {
            let data = try JSONEncoder().encode(value)
            let url = baseUrl.appendingPathComponent(key)
            try data.write(to: url)
        } catch {
            // Sample code lacking error handling
        }
    }
    
    func get<T: Codable>(key: String) -> T? {
        do {
            let url = baseUrl.appendingPathComponent(key)
            guard fileManager.fileExists(atPath: url.path) else {
                return nil
            }
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            // Sample code lacking error handling
            return nil
        }
    }
    
    func getKeys() -> [String] {
        var isdirectory: ObjCBool = true
        let path = baseUrl.path
        guard fileManager.fileExists(
            atPath:  path,
            isDirectory: &isdirectory
        ) else {
            return []
        }
        
        do {
            return try fileManager.contentsOfDirectory(atPath: path)
        } catch {
            // Sample code lacking error handling
            return []
        }
    }
    
    func remove(key: String) {
        let url = baseUrl.appendingPathComponent(key)
        guard fileManager.fileExists(atPath: url.path) else {
            return
        }
        
        do {
            try fileManager.removeItem(at: url)
        } catch {
            // Sample code lacking error handling
        }
    }
    
    func flush() {
        guard fileManager.fileExists(atPath: baseUrl.path) else {
            return
        }
        
        do {
            try fileManager
                .contentsOfDirectory(
                    at: baseUrl,
                    includingPropertiesForKeys: nil
                )
                .forEach {
                    try? fileManager.removeItem(at: $0)
                }
        } catch {
            // Sample code lacking error handling
        }
    }

    
    private let purpose: String
    private let fileManager: FileManager
    private let baseUrl: URL
}
