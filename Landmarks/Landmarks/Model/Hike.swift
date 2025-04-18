//
//  Hike.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import Foundation

//데이터 모델 정의
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance : Double
    var difficulty: Int
    var observations: [Observation] //이건 사용자 정의 배열타입인가
    
    //formatter: 거리 길이 포맷 규격화 인스턴스
    static var formatter = LengthFormatter()
    
    var distanceText: String {
        Hike.formatter 
            .string(fromValue: distance, unit: .kilometer)
    }
    
    //2중 json이면 구조체 안에 구조체 정의하는건가 Codable, Hashable뭘까
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
         
        var elevation: Range<Double> //Range 얘 뭐얒
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
