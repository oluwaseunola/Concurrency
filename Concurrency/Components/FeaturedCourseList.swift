//
//  FeaturedCourseList.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-23.
//

import SwiftUI

struct FeaturedCourseList: View {
    var featurdCourses : [Course]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            
            HStack(spacing: 20){
                
                if featurdCourses.count > 0 {
                    ForEach(featurdCourses, id:\.id){ course in
                        
                        NavigationLink {
                            CourseView(course: course)
                        } label: {
                            
                            FeaturedCard(course: course)

                        }

                        
                        
                    }
                } else{
                    
                    ForEach(0..<5, id:\.self){ number in
                        
                        FeaturedCard(course: coursePreviewData)
                        
                    }
                    
                }
                
                
                
            }.padding(.horizontal, 20)
            
        }.edgesIgnoringSafeArea(.all)
            
            
    }
}

struct FeaturedCourseList_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCourseList(featurdCourses: [coursePreviewData])
    }
}
