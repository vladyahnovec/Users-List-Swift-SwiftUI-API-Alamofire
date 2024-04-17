//
//  ContentView.swift
//  UsersList
//
//  Created by Круглич Влад on 16.04.24.
//

import SwiftUI
import Alamofire
struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    var body: some View {
       MainView(vm: vm)
    }
}

#Preview {
    ContentView()
}
