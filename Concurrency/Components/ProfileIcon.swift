//
//  ProfileIcon.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-29.
//

import SwiftUI

struct ProfileIcon: View {
    var body: some View {
        
        Image(systemName: "person.circle").foregroundColor(.primary)
            .frame(width: 26, height: 26).mask(Circle())
            .padding()
            .overlay(Circle().stroke().foregroundColor(.purple))

        
        
    }
}

struct ProfileIcon_Previews: PreviewProvider {
    static var previews: some View {
        ProfileIcon()
    }
}
