//
//  NetworkProvider.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

protocol NetworkProvider {
    /**
     Requests information based on the Generic constraint that must conform to
     Decodable from the given microservice url.  This will always use "GET" as
     the HTTP Method.
     
     Note that the return type CAN be nil, because it is possible that the server
     does not have any data to return.
     
     - parameters:
         - destination:  The URL for the request
     
     - throws: A `NetworkError`
     */
    func retrieve<Response: Decodable>(
        destination: URL
    ) async throws -> Response?
}
