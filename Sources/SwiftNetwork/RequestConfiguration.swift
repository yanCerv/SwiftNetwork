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
}
