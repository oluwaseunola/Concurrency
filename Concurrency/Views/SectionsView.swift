//
//  SectionsView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-26.
//

import SwiftUI

struct SectionsView: View {
    
    @EnvironmentObject var sectionViewModel : SectionViewModel
    @Environment(\.isSearching) var isSearching
    
    var body: some View {
        VStack{
            
            
            if isSearching{
                if sectionViewModel.filteredSections.count > 0 {
                List{
                    
                    ForEach(sectionViewModel.filteredSections, id: \.id){
                        section in
                        
                        Text(section.title)
                        
                    }
                    
                    
                    
                }
                
            }
                
                else{
                    
                    List{
                        Text("No Results")
                    }
                }
            }else{
                
                SectionList()
                

            }
        
            

            
        }.navigationTitle(Text("Sections"))
        
    }
}

struct SectionsView_Previews: PreviewProvider {
    static var previews: some View {
        SectionsView().environmentObject(SectionViewModel())
    }
}
