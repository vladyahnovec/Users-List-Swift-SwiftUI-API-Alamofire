//
//  ViewModel.swift
//  UsersList
//
//  Created by Круглич Влад on 16.04.24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var users: [CodableType] = []
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
}
