//
//  EndPoint.swift
//
//
//  Created by Yan Cervantes on 12/08/24.
//

import Foundation

public enum Method: String {
  case post = "POST"
}

public protocol EndPoint {
  var path: String { get }
  var bodyRequest: String? { get }
  var request: URLRequest { get }
}

//extension EndPoint {
  
//  private var environment: Environment {
//    Environment.shared
//  }
//  
//  private var url: URL {
//    URL(string: "\(environment.get(value: .baseUrl))\(path)")!
//  }
//  
//  private var headers: [String: String] {
//    Headers.values()
//  }
//  
//  private var method: Method {
//    return .post
//  }
//  
//  private var data: Data? {
//    if let dataRequest = bodyRequest?.data(using: .utf8) {
//      return dataRequest
//    }
//    return nil
//  }
  
//  var request: URLRequest {
//    var request = URLRequest(url: url)
//    request.allHTTPHeaderFields = headers
//    request.httpMethod = method.rawValue
//    request.httpBody = data
//    request.timeoutInterval = 300
//    return request
//  }
//}
