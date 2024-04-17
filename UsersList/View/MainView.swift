//
//  MainView.swift
//  UsersList
//
//  Created by Круглич Влад on 16.04.24.
//

import SwiftUI
import Alamofire

struct MainView: View {
    @StateObject var vm : ViewModel
    @State var checker = false
    var body: some View {
        VStack{
            VStack {
                HStack {
                    Spacer()
                    Text("Users List")
                        .font(.custom("Montserrat-Bold", size: 30))
                        .foregroundStyle(Color.gray)
                    Spacer()
                }
                ZStack {
                    Rectangle()
                        .fill(Color.grayColor)
                        .frame(width: 250, height: 40)
                        .cornerRadius(10)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                            .foregroundColor(.gray)
                            .padding(.leading, 10)
                        TextField("Name...", text: $vm.findText)
                            .padding(.trailing, 10)
                            .foregroundColor(.gray)
                    }
                }
                ScrollView {
                    if vm.foundUsers.count == 0 && vm.findText != "" {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 100, height: 100)
                                Image(systemName: "person.slash.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 50))
                            }
                            .padding(.top, 50)
                            Text("Incorrect user name ;(")
                                .padding(.top, 20)
                                .font(.custom("Montserrat-Bold", size: 20))
                        }
                    }
                    else {
                        VStack(alignment: .leading) {
                            ForEach(vm.foundUsers.count == 0 ? vm.users : vm.foundUsers, id: \.self) {
                                user in
                                VStack {
                                    HStack {
                                        ZStack {
                                            Circle()
                                                .fill(.gray)
                                                .frame(width: 70)
                                            Image(systemName: "person")
                                                .font(.system(size: 40))
                                                .foregroundColor(.white)
                                        }
                                        Spacer()
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(user.name)
                                                    .font(.custom("Montserrat-Bold", size: 20))
                                                Text(user.username)
                                                    .font(.custom("Montserrat-Light", size: 17))
                                                    .padding(.top, 1)
                                                Text(user.address.city)
                                                    .font(.custom("Montserrat-Light", size: 15))
                                                Text(user.company.name)
                                                    .font(.custom("Montserrat-Light", size: 15))
                                                Text(user.email)
                                                    .font(.custom("Montserrat-Regular", size: 12))
                                                    .padding(.top, 1)
                                            }
                                            .padding(.top, 10)
                                            .padding(.leading, 10)
                                            Spacer()
                                        }
                                    }
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 250, height: 2)
                                }
                                
                            }
                        }
                    }
                    Spacer()
                }
                HStack(spacing: 30) {
                    Spacer()
                    Button(action: {vm.sortAlphabet()}) {
                        Image(systemName: "abc")
                    }
                    Menu {
                        ForEach(vm.users, id: \.self) {
                            user in
                            Button(action: {
                                vm.findText = ""
                                vm.sortCity = user.address.city
                            }) {
                                Text(user.address.city)
                            }
                        }
                    } label: {
                        Image(systemName: "location.fill")
                            .font(.system(size: 20))
                    }
                    
                    Menu {
                        ForEach(vm.users, id: \.self) {
                            user in
                            Button(action: {
                                vm.findText = ""
                                vm.sortCompany = user.company.name
                              }) {
                                Text(user.company.name)
                            }
                        }
                    } label: {
                        Image(systemName: "hammer.fill")
                            .font(.system(size: 20))
                    }
                }
                .foregroundColor(.black)
                .padding(.top, 5)
            }
            .padding(30)
            .frame(width: 300, height: 500)
            .background(.white)
            .cornerRadius(30)
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Color.grayColor)
    }
}
