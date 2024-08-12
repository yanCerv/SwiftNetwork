//
//  File.swift
//  
//
//  Created by Yan Cervantes on 12/08/24.
//

import Foundation

public enum ErrorHandler: Error {
  case requestFailed
  case jsonConversionFail(message: String)
  case error(message: String, statusCode: Int)
  case connection
  
  public var statusCode: Int {
    switch self {
    case .requestFailed:
      return 500
    case .jsonConversionFail(_):
      return -1001
    case .error(_, let statusCode):
      return statusCode
    case .connection:
      return 550
    }
  }
  
  public var message: String {
    switch self {
    case .requestFailed:
      return "Error al intentar conectar con los servidores."
    case .jsonConversionFail(let message):
      return "Error: \(message)"
    case .error(let message, _):
      return "\(message)"
    case .connection:
      return "No internet connection."
    }
  }
}
