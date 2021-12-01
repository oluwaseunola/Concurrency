//
//  Network.swift
//  Concurrency
//
//  Created by Seun Olalekan on 2021-11-25.
//

import Foundation

import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/bccrv6col91w?access_token=EQCadry7w7KRV-kT2ysL3r-TUIEpDC-CR58j0s9zo30")!)
    
}
