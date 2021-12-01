//
//  SafariViewWrapper.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-29.
//

import Foundation
import SafariServices
import SwiftUI

struct SFSafariViewWrapper : UIViewControllerRepresentable{
    
    
   
    let url : URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) -> SFSafariViewController {
        
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
    
    
    
    
}
