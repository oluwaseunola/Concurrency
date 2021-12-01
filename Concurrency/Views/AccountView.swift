//
//  AccountView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-29.
//

import SwiftUI


struct AccountView: View {
    
    @StateObject var accountViewModel = AccountViewModel()
    var body: some View {
        
        VStack{if let user = accountViewModel.user{
            
            ProfileCard(user: user).padding()
            
        }else{
            
            Text("No User")
        }}.task{
            
            await accountViewModel.getUser()
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
