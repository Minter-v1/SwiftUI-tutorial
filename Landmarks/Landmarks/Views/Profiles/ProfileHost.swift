//
//  ProfileHost.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode //editMode 이새끼는 뭐지?
    @Environment(ModelData.self) var modelData
    @State private var draftProfile = Profile.default //Model>Profile에서 default를 불러오네?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack {
                //뭘까
                if editMode?.wrappedValue == .inactive {
                    Button("Cancel",role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .active
                    }
                }
                
                Spacer()
                EditButton()
            }
            if editMode?.wrappedValue == .inactive { //뭐여 이새끼
                ProfileSummary(profile: modelData.profile) //위에 상태값 가져오네여>?
            } else {
                ProfileEditor(profile: $draftProfile) //프로필 바인딩을 전달한다는데 머지?
                    .onAppear { draftProfile = modelData.profile }
                    .onDisappear { modelData.profile = draftProfile } //값 변경이 일어나는 것 같은데
            }
            
        }
        .padding() //기본값은 얼마일까
    }
}

#Preview {
    ProfileHost()
        .environment(ModelData())
}
