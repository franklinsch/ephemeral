//
//  ChatHandler.swift
//  Ephemeral
//
//  Created by Daniel Grumberg on 04/02/2017.
//
//

import PerfectLib
import PerfectWebSockets
import PerfectHTTP

struct ChatHandler: WebSocketSessionHandler {
  
  /// Optionally indicate the name of the protocol the handler implements.
  /// If this has a valid, the protocol name will be validated against what the client is requesting.
  public var socketProtocol: String? = "chat"

  /// This function is called once the WebSocket session has been initiated.
  public func handleSession(request req: HTTPRequest, socket: WebSocket) {
    socket.readStringMessage {
      (string, opCode, fin) in
    
      guard let string = string else {
        socket.close()
        return
      }
      
      socket.sendStringMessage(string: string, final: true) {
        
        self.handleSession(request: req, socket: socket)
      
      }
      
    }
    
  }
}
