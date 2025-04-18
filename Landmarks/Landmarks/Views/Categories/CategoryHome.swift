//
//  CategoryHome.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false //상태변수
    
    var body: some View {
        
        //ㅅㅂ? 아직 머 분리 안돘ㄴ느데
        NavigationSplitView {
            List { // 아직도 리스트 개념 애매함
                modelData.features[0].image
                    .resizable()
                    .scaledToFill() // 오 뭔가 꽉찬다..
                    .frame(height: 200)
                    .clipped() // 얘는 뭐하는 앨까..
                    .listRowInsets(EdgeInsets()) //얘도 뭐임?
                
                //왜 리스트 내부에선 ForEach만 사용할까? 얘랑 List랑 비슷한 기능이라고 하는 것 같은데
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!) //오!!! 언패킹해서 사용하는군
                }
                .listRowInsets(EdgeInsets())//닌 또 뭐야 -> 뭔가 왼쪽으로 샤샥 움직엿는데
            }
            .listStyle(.inset) //얘도뭐임
            .navigationTitle("Featured")
            .toolbar { //툴바..?
                Button{
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle") //오 아이폰 시스템 사용자 아이콘 생겼다 Label() 얘는 뭐지
                }
                
            }
            .sheet(isPresented: $showingProfile) { //이 시트도 뭐지...?
                ProfileHost()
                    .environment(modelData) //데이터 주입
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
