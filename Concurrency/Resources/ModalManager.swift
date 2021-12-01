//
//  ModalManager.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-29.
//

import Foundation

class ModalManager : ObservableObject {
    
    enum ActiveModals{
        
        case signIn, signUp, resetPassword
        
    }
    
    
    @Published public var showModal : Bool = false
    @Published public var activeModal : ActiveModals = .signIn
    
    
}

