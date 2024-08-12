// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Combine

typealias PublisherResult<T: Decodable> = AnyPublisher<T, ErrorHandler>

protocol Request {
  func request<T: Decodable>(_ resource: RequestConfiguration) -> PublisherResult<T>
}

extension Request {
  private var session: ClientURLSession {
    ClientURLSession()
  }
  
  private var requestSession: URLSession {
    URLSession(configuration: .default, delegate: session, delegateQueue: .main)
  }
  
  func request<T: Decodable>(_ resource: RequestConfiguration) -> PublisherResult<T> {
    let request = resource.request
    return requestSession.dataTaskPublisher(for: request)
      .receive(on: DispatchQueue.main)
      .tryMap({ element -> Data in
        if let response = element.response as? HTTPURLResponse {
          switch response.statusCode {
          case 200...299:
            return element.data
          default:
            if let error = element.response as? Error {
              throw ErrorHandler.error(message: error.localizedDescription, statusCode: response.statusCode)
            } else {
              throw ErrorHandler.error(message: "Error", statusCode: response.statusCode)
            }
          }
        }
        return element.data
      })
      .decode(type: T.self, decoder: JSONDecoder())
      .mapError({ error in
        return .jsonConversionFail(message: error.localizedDescription)
      })
      .eraseToAnyPublisher()
  }
}
