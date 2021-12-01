//
//  HomeView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var courseViewModel : CourseViewModel
    @EnvironmentObject var modalManager : ModalManager
    var attributedString : AttributedString {
//       create the subject you will be acting on
        var subject = AttributedString(courseViewModel.featuredSubject.rawValue)
//        Create the container of attributes
        var container = AttributeContainer()
//       Start adding attributes to it
        
        
        if courseViewModel.featuredCourses.count > 0 {
            container.foregroundColor = Color(hex: courseViewModel.featuredCourses[0].colors[0]!)
            
        }else{
            container.foregroundColor = .pink
            
        }
    
//        Merge your attributes with your subject.
        subject.mergeAttributes(container)
        
        return "Learn " + subject
    }
    
    var body: some View {
        
        ZStack(alignment:.top){
            ScrollView{
                HStack {
                    DateTitle(title: attributedString)
                        
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    .padding(.top,20)
                    
                    ProfileIcon().padding(.trailing, 20).onTapGesture {
                        
                        modalManager.showModal.toggle()
                        
                        
                    }
                }
                
                FeaturedCourseList(featurdCourses: courseViewModel.featuredCourses).padding(.top, 20)
                
                Text("All Courses")
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                
                CourseList(courses: courseViewModel.courses)
                    .padding(.top, 20)
                
                    
            }
            Color.white.animation(.easeIn)
                .ignoresSafeArea()
                .frame(height:0)
        }.navigationBarHidden(true)

        
        
            
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(CourseViewModel()).environmentObject(ModalManager())
    }
}
