//
//  SectionList.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-26.
//

import SwiftUI

struct SectionList: View {
    @EnvironmentObject var sectionViewModel : SectionViewModel

    var body: some View {
        
        
        List{
            
            ForEach($sectionViewModel.sections, id: \.id){ $section in
                
                HStack {
                    Text(section.title)
                        
                    Spacer()
                    
                    Image(systemName: section.isPinned ? "pin" : "")
                }.swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        
                        Button {
                            section.isPinned.toggle()
                            sectionViewModel.moveToTop()

                        } label: {
                            if section.isPinned == true{
                               
                                Label("Unpin", systemImage: "pin.slash")
                                
                            }else{
                                
                                Label("Pin", systemImage: "pin")

                            }
                        }.tint(section.isPinned ? .red : .blue)

                        
                    }
                  
                
        
            }
        }.task {
            await sectionViewModel.fetch()
        }
        .refreshable {
            sectionViewModel.randomizeSections()
        }
        
        
        
    }
}

struct SectionList_Previews: PreviewProvider {
    static var previews: some View {
        SectionList().environmentObject(SectionViewModel())
    }
}
