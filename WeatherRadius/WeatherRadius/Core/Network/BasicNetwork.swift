//
//  BasicNetwork.swift
//  WeatherRadius
//
//  Created by Curtis Halbrook on 12/22/23.
//

import Foundation

class BasicNetwork: NetworkProvider {
    
    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        
        self.session = URLSession(configuration: config)
    }
    
    func retrieve<Response: Decodable>(
        destination: URL
    ) async throws -> Response? {
        var request = URLRequest(url: destination)
        request.httpMethod = "GET"
        
        do {
            let (data, response) = try await self.session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.unexpected(
                    message: "Returned a non-http response?",
                    innerError: nil
                )
            }
            
            let code = httpResponse.statusCode
            guard 200...299 ~= code else {
                throw NetworkError.non200Code(errorCode: code)
            }
            
            //Limited handling of other possibilities; more robust network
            //sanitization left as an exercise for the reader
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(Response.self, from: data)
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unexpected(
                message: "Failed calling \(destination.absoluteString)",
                innerError: error
            )
        }
    }

    private let session: URLSession
}
