//
//  MapView.swift
//  Landmarks
//
//  Created by Subeen on 2023/07/30.
//

import SwiftUI
import MapKit   // MapKit 사용하기

struct MapView: View {
    var coordinate: CLLocationCoordinate2D  // 고정 좌표 전달
    
    // 지도에 대한 지역 정보를 보유하는 전용 상태 변수 생성.
    @State private var region = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
//        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        // 하드코딩 제거
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .onAppear {
                setRegion(coordinate)   // 앱 실행시, 변수 region에 현재 좌표값이 update 되도록 지정
            }
    }
    
    // 현재 좌표를 기반으로 지역을 update
    private func setRegion(_ coordinates: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
