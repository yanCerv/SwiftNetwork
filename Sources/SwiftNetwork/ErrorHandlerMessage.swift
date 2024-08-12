//
//  File.swift
//  
//
//  Created by Yan Cervantes on 12/08/24.
//

import Combine

public protocol ErrorHandlerMessage {
  func error(_ subscriber: Subscribers.Completion<ErrorHandler>) -> ErrorHandler?
}

public extension ErrorHandlerMessage {
  func error(_ subscriber: Subscribers.Completion<ErrorHandler>) -> ErrorHandler? {
    var errorHandler: ErrorHandler?
    switch subscriber {
    case .failure(let error):
      errorHandler = ErrorHandler.error(message: error.message, statusCode: error.statusCode)
      return errorHandler
    case .finished:
      return errorHandler
    }
  }
}
