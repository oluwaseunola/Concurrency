//
//  ModalView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-29.
//

import SwiftUI

struct ModalView: View {
    @EnvironmentObject var modalManager : ModalManager
    
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all).onTapGesture {
                modalManager.showModal = false
                

            }.animation(.easeInOut, value: modalManager.showModal)
            
            switch modalManager.activeModal{
            case.signIn: SignInView()
            case.signUp: SignUpView()
            case.resetPassword: ResetPasswordView()
                
            }
            
            
        }

        
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView().environmentObject(ModalManager())
    }
}
