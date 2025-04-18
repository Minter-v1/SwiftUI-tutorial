//
//  CategoryRow.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String //얘네들이 프로퍼티가 될 것임.. 다른 뷰에서 이거 호출?암튼 사용할때 Category(categoryName: , items: ) 이렇게 쓰는구나
    
    
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15) //뭘까..
                .padding(.top, 5) //오호...위로 5공간.. 이거 단위는 뭘까?
            
            //오 가로로 스크롤 된당
            ScrollView(.horizontal, showsIndicators: false) { //파라미터는 뭘까?
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: { CategoryItem(landmark: landmark) }
                        
                    }
                }
            
            }
            .frame(height: 185) //frame modifier 프로퍼티 다시 확인하자
        }
        
    }
}

#Preview {
    let landmarks = ModelData().landmarks //데이터모델에서 얘만 가져오네
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))//프리픽스 뭐였더라.. 그리고 이건 형변환이냐 생성이냐?
    )
}
