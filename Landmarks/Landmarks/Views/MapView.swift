//
//  MapView.swift
//  Landmarks
//
//  Created by 이민지 on 4/15/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var body: some View {
//        값이 변경될 때 업데이트되도록 지도의 초기화 프로그램을 위치 입력을 받는 초기화 프로그램으로 변경
        Map(position: .constant(.region(region)))
    }
    
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    //고정좌표 전달
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
