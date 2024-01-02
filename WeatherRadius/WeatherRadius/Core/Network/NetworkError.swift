//
//  NetworkError.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

public enum NetworkError: Error {
    /// An error happened that was unexpected.  An example could be JSON format
    /// failures of response objects
    case unexpected(message: String, innerError: Error? = nil)

    /// A non-200 series code was returned
    case non200Code(errorCode: Int)    
}
