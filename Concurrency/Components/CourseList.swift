//
//  CourseList.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-23.
//

import SwiftUI

struct CourseList: View {
    var courses : [Course]
    var column = [GridItem(.adaptive(minimum: 160))]
    var body: some View {
        
        LazyVGrid(columns: column, spacing: 15){
            if courses.count > 0{
                
                ForEach(courses, id: \.id){ course in
                    
                    NavigationLink {
                        CourseView(course: course)
                    } label: {
                        CourseCard(course: course)

                    }

                    
                }.padding(.horizontal, 10)
                
            } else{
               
                ForEach(0..<5, id: \.self){ number in
                    CourseCard(course: coursePreviewData)
                }.padding(.horizontal, 10)
                
            }
           
            
        }
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList(courses: [coursePreviewData]).environmentObject(CourseViewModel())
    }
}
