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
    @State var name = ""
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
                        TextField("Name...", text: $name)
                            .padding(.trailing, 10)
                            .foregroundColor(.gray)
                    }
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(vm.users, id: \.self) {
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
                    Spacer()
                }
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
