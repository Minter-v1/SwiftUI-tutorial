//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 이민지 on 4/15/25.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    
            }
        }
    }
}

//프리뷰1 -> 이름 지정 가능
#Preview("Turtle Rock") {
    LandmarkRow(landmark: landmarks[0])
}

//프리뷰2
#Preview("Salmon") {
    LandmarkRow(landmark: landmarks[1])
}

//그룹으로 묶어서 보기
#Preview("Group") {
    //자식 요소들을 하나의 view로 묶는다
    let landmarks = ModelData().landmarks
    
    // 이제 한줄연산?이 아니기 때문에 return 키워드 사용
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
