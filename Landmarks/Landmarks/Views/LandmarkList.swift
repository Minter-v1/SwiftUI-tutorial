//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 이민지 on 4/15/25.
//

import SwiftUI

struct LandmarkList: View {
    //true 니까 필터인 favorite인 애들만 체크해줌
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    
    
    
    
    
    var body: some View {
        NavigationSplitView{
            //필터링 된 버전
            
            //이렇게 묶을 수 있다
            List {
                //토글 바가 생김
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                //리스트 띄움
                ForEach(filteredLandmarks) { landmark in
                    //여기로 이동될거고(누르면)
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    
                        //누르기 전까진 이걸 보여주고
                    } label: {
                        //랜드마크 전체 리스트
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            //애니메이션 개선?
            .animation(.default, value: filteredLandmarks)
            //Nav 타이틀 입력?
            .navigationTitle("Landmarks")
            } detail : {
                Text("Select a Landmark")
        }
        
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
