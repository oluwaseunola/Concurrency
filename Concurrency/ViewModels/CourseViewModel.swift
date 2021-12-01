//
//  CourseViewModel.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-25.
//

import Foundation
import Apollo

enum FeaturedSubject : String, CaseIterable {
    
    case SwiftUI = "SwiftUi"
    case Design = "Design"
    
}

class CourseViewModel: ObservableObject{
    
    @Published public private(set) var courses : [Course] = []
    var featuredSubject : FeaturedSubject = FeaturedSubject.allCases.randomElement() ?? .SwiftUI
    @Published public private(set) var featuredCourses = [Course]()
    
    
    
    func queryCourses() async throws -> GraphQLResult<CourseQuery.Data>?{
        
        return await withCheckedContinuation({ cont in
            
            Network.shared.apollo.fetch(query: CourseQuery()){
                result in
                
                switch result{
                    
                case.success(let data):
                    cont.resume(returning: data)
                    
                case.failure(let error):
                    guard let neverError = error as? Never else{return}
                    
                    cont.resume(throwing: neverError)
                    
                }
                
                
            }
        })
        
        
    }
    
    @MainActor
    func fetch() async   {
        do{
            let result = try await queryCourses()
            
            if let courseCollection = result?.data?.courseCollection{
                
                
                    courses = (process(data: courseCollection))
                    
                    
                
                
                findFeaturdFunction()

                
            
            }
            
        }catch{
            
            print(error)
        }
    }
    
    func process(data: CourseData) -> [Course]{
        
        let courses = CoursesCollection(data)
        return courses.courses
    }
    
    @MainActor
    private func findFeaturdFunction(){

            featuredCourses =  (courses.filter({ $0.subject == featuredSubject.rawValue  })) ?? []

    }
    
}
