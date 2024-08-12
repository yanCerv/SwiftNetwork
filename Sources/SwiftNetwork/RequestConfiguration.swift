//
//  File 2.swift
//  
//
//  Created by Yan Cervantes on 12/08/24.
//

import Foundation

public struct RequestConfiguration: EndPoint {
  public var path: String
  public var bodyRequest: String?
  public var request: URLRequest
  
  public init(path: String, bodyRequest: String? = nil, request: URLRequest) {
    self.path = path
    self.bodyRequest = bodyRequest
    self.request = request
  }
}
