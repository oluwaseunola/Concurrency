//
//  CourseView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-12-01.
//

import SwiftUI

struct CourseView: View {
    @Environment(\.presentationMode) var presentationMode
    var course : Course
    var body: some View {
            ZStack(alignment: .top) {
                    content

                    HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                }) {
                                    CloseButton()
                  }
                     Spacer()
             }
             .padding(.horizontal, 20)
             .padding(.top, 16)
             .frame(maxWidth: .infinity)
             .frame(height: 44)
            }
        .navigationBarHidden(true)
    }

    var content: some View {
        ScrollView {
            CourseViewCover(course: course)

            LazyVStack(spacing: 0) {
                ForEach((course.sections?.sectionCollection.indices)!, id: \.self) { index in
                    
                    NavigationLink {
                        SectionView(section: (course.sections?.sectionCollection[index])!, course: course)
                    } label: {
                        
                        SectionRow(section: (course.sections?.sectionCollection[index])!, index: index + 1)
                    }

                    
                    
                }
            }
            .padding(20)
        }
            .ignoresSafeArea()
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: coursePreviewData)
    }
}
