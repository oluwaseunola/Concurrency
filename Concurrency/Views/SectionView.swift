//
//  SectionView.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-12-01.
//

import SwiftUI

struct SectionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    var section : Section
    var course : Course
    @State var attributedString : AttributedString = ""
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
            SectionViewCover(course: course, section: section)
            Text(attributedString).padding(16)
            
        }
        .ignoresSafeArea( edges: .top)
        .onAppear {
            do{
                attributedString = try AttributedString(markdown: section.content)
                
            }catch{
                
                print(error)
            }
            
            
            
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: (coursePreviewData.sections?.sectionCollection[0])!, course: coursePreviewData)
    }
}
