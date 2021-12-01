//
//  DateTitle.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-23.
//

import SwiftUI

struct DateTitle: View {
    @State var title : AttributedString
    @State var currentDate : String = ""
    
    var body: some View {
       
        VStack(alignment:.leading){
            Text(currentDate.uppercased())
                .font(.footnote)
                .opacity(0.7)
        
            
            Text(title)
                .font(.largeTitle)
                .bold()

            
        }.onAppear {
            currentDate = Date.now.formatted(.dateTime.year().month().day().weekday())
        }
        
        
    }
}

struct DateTitle_Previews: PreviewProvider {
    static var previews: some View {
        DateTitle(title: "Learn SwiftUI")
    }
}
