//
//  CategoryItem.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark //얘는 그냥 타입 선언까지만 한거좒앙
    
    var body: some View {
        VStack(alignment: .leading) {
            //이건 전체 뭉텅이 아닝가..? 하나만 표시해야한ㄴ거 아닌가
            landmark.image
                .renderingMode(.original) //이 modifier는 뭐여
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5) //이미지 코너 radius 설정인가보군
            
            Text(landmark.name)
                .foregroundStyle(.primary) //글자색이 바뀌었당
                .font(.caption)
                
        }
        .padding(.leading, 15)
    }
}



#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
