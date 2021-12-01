//
//  SectionViewModel.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-26.
//

import Foundation
import Apollo

class SectionViewModel : ObservableObject {
    
    @Published public var sections = [SectionModel]()
    @Published public private(set) var filteredSections = [SectionModel]()
    
    func querySections() async throws -> GraphQLResult<SectionsQuery.Data>?{
        
        return await withCheckedContinuation({ cont in
            
            Network.shared.apollo.fetch(query: SectionsQuery()){
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
    
    
    func fetch() async   {
        do{
            let result = try await querySections()
            
            if let sectionCollection = result?.data?.sectionCollection{
                
                DispatchQueue.main.async { [weak self] in
                    self?.sections = (self?.process(data: sectionCollection))!
                    
                    
                }
                

                
            
            }
            
        }catch{
            
            print(error)
        }
    }
    
    func process(data: SectionsCollectionData) -> [SectionModel]{
        
        let sections = SectionsDataCollection(data)
        return sections.sections
    }
     
    func randomizeSections(){
        
        sections = sections.shuffled()
        
    }
    
    func moveToTop(){
        
        sections = sections.sorted(by: {$0.isPinned && !$1.isPinned})
        
        
    }
    
    func filterSections(text: String){
        
        filteredSections = []
        
        let searchText = text.lowercased()
        
        sections.forEach { section in
            
            let sectionTitle = section.title
            
            if sectionTitle.lowercased().range(of: searchText, options: .regularExpression) != nil{
                
                filteredSections.append(section)
                
            }
            
            
            
        }
        
        
        
        
    }
    
}
