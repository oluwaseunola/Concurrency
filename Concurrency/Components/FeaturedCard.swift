//
//  FeaturedCard.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-23.
//

import SwiftUI

struct FeaturedCard: View {
    
    var course : Course

    var body: some View {
        VStack{
    
            AsyncImage(url: URL(string: course.image)) { image in
                image.resizable().aspectRatio( contentMode: .fill)
                    .frame(width: 220, alignment: .center)
            } placeholder: {
                ProgressView()
            }

            
            Text(course.title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth:.infinity, alignment: .leading)
                .lineLimit(2)
            
            Text("\(course.numberOfSections) sections - \(course.numberOfHours)")
                .font(.footnote)
                .foregroundColor(.white)
                .opacity(0.7)
                .frame(maxWidth:.infinity, alignment: .leading)
                .lineLimit(1)
            
            Text(course.subtitle)
                .font(.body)
                .foregroundColor(.white)
                .opacity(0.7)
                .frame(maxWidth:.infinity, alignment: .leading)
                .lineLimit(1)
            
            Spacer()
            
            
        }.padding(20)
        .frame(width: 300, height: 400)
        .background(AngularGradient(colors: [Color(hex: course.colors[0]!), Color(hex: course.colors[1]!)], center: .bottomLeading))
        .cornerRadius(30)
            
    }
}

struct FeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedCard(course: coursePreviewData)
    }
}
