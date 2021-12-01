//
//  UserViewModel.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-29.
//

import Foundation

class AccountViewModel : ObservableObject{
    
    @Published public private(set) var user : User?
    
    
    func getUser()async {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/1") else {print("no data")
            return}
        
        let req = URLRequest(url: url)
        
        do{
            let data = try await URLSession.shared.data(for: req)
            let result = try JSONDecoder().decode(User.self, from: data.0)
            
            DispatchQueue.main.async { [weak self] in
                self?.user = result
            }

        }catch{
            print(error)
        }
        
        

    }
    
    
    
    
    
}
