//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 이민지 on 4/15/25.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        //사용자가 스크롤 가능하다록 VStack -> ScrollView 로 바꿈
        ScrollView {
            
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    Text(landmark.park)
                        
                    Spacer()
                    Text(landmark.state)
                      
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
            
           
        }
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
