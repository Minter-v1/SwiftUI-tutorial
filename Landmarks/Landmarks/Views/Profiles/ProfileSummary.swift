//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date) //이건뭘까..
                
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90)) //색 변화..?
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5) //뭔가 회색빛 조금 가미 됨
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom) //바닥쪽에 패딩 약간 생김
                    }
                }
                
                Divider() //희미한 구분선 생김
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0]) //다른 뷰? 호출할때는 함수처럼 호출하는지 체크
                }
            }
        }
    }
}

#Preview {
    ProfileSummary(profile: Profile.default) //body위에 profile 프로퍼티 있으면 여기서 구조체 파라미터로 입력 받아야하나..?
        .environment(ModelData())
}
