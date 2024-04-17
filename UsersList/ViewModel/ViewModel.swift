//
//  ViewModel.swift
//  UsersList
//
//  Created by Круглич Влад on 16.04.24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var users: [CodableType] = []
    @Published var foundUsers: [CodableType] = []
    @Published var findText = "" {
        didSet {
            findUsers()
        }
    }
    
    @Published var sortCity = "" {
        didSet {
            sortByCity()
        }
    }
    @Published var sortCompany = "" {
        didSet {
            sortByCompany()
        }
    }

    init() {
        NetworkingManager.shared.fetchData(completion: { result in
            switch result {
            case .success(let success):
                self.users = success
            case .failure(let failure):
                print(failure)
            }
        })
    }
    
    
    func findUsers() {
        self.foundUsers = users.filter { $0.name.contains(findText) }
    }
    
    func sortAlphabet() {
        self.users = users.sorted {$0.name.lowercased() < $1.name.lowercased()}
    }
    
    func sortByCity() {
        self.foundUsers = users.filter { $0.address.city.lowercased().contains(sortCity.lowercased())}
    }
    func sortByCompany() {
        self.foundUsers = users.filter { $0.company.name.lowercased().contains(sortCompany.lowercased())}
    }
}
