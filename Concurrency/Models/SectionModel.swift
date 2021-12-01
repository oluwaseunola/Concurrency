//
//  SectionModel.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-26.
//

import Foundation

typealias SectionsCollectionData = SectionsQuery.Data.SectionCollection

struct SectionsDataCollection : Decodable {
    
    let sections : [SectionModel]
    
    init(_ sectionsCollection: SectionsCollectionData?){
        
        self.sections = sectionsCollection?.sections.map({
            
            SectionModel($0)

        }) ?? []
        
    }
    
}

struct SectionModel : Decodable,Identifiable{
    
    let id : String
    let title : String
    var isPinned : Bool = false
    
    init(_ section : SectionsCollectionData.Section?){
        
        self.id = section?.sys.id ?? ""
        self.title = section?.title ?? ""
    }
    
    
}

