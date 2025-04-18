//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by 이민지 on 4/17/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile //얘는 무슨 래퍼일까
    
    //얘 타입이 뭐지? 그리고 언패킹 하네?
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
                let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
                return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("UserName")
                Spacer()
                TextField("Username", text: $profile.username) //무슨 바인딩일까...
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing) //얘는 정렬인 것 같은데
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            
            //Picker는 또 뭐여 ㅋㅋ
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
                
            }
            
            //날짜 선택기 같은데
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                    Text("Goal Date")
            }
        }
    }
}

#Preview {
    ProfileEditor(profile: .constant(.default)) //읽기전용? .default는 뭘까? 스위프트는 뭔 .(dot)으로 시작해서 항상 넣우주네
}
