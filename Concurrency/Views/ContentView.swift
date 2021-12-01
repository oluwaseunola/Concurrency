//
//  ContentView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var courseViewModel : CourseViewModel
    @EnvironmentObject var sectionViewModel : SectionViewModel
    @StateObject var modalManager = ModalManager()
    @State var text = ""
    
    var body: some View {
        
        ZStack {
            TabView{
                NavigationView {
                    HomeView().environmentObject(modalManager)
                    
                    }.tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    
                   
                }
                
                 NavigationView {
                    SectionsView()
                 }.searchable(text: $text){
                     
                     ForEach(sectionViewModel.sections.prefix(2)){
                         section in
                         
                         Text(section.title).searchCompletion(section.title)
                         
                     }
                 }
                 .onSubmit(of: .search, {
                     sectionViewModel.filterSections(text: text)
                 })
                 
                    .tabItem {
                    Image(systemName: "heart.text.square")
                    Text("Sections")
                }
                
                AccountView().tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
                
            }.task {
                await courseViewModel.fetch()
                
        }
            if modalManager.showModal {
                ModalView().environmentObject(modalManager)
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(CourseViewModel())
            .environmentObject(SectionViewModel())
    }
}
