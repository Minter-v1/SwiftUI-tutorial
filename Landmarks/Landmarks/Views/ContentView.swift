//
//  ContentView.swift
//  Landmarks
//
//  Created by 이민지 on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    //뭔가 변수나 구조체는 body 프로퍼티 밖으로 빼는 것 같은데
    @State private var selection: Tab = .featured //얘는 뭘까...
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                        Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)//얘도뭘까
            
            LandmarkList()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list) //얘도뭘까
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
