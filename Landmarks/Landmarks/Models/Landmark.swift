//
//  Landmark.swift
//  Landmarks
//
//  Created by Subeen on 2023/07/30.
//

//import Foundation
//import SwiftUI
//import CoreLocation
//
//struct Landmark: Hashable, Codable, Identifiable {
//    var id: Int
//    var name: String
//    var park: String
//    var state: String
//    var description: String
//
//    private var imageName: String
//
//    // 각 랜드마크와 연결된 이미지를 모델링
//    var image: Image {
//        Image(imageName)
//    }
//
//    // 각 랜드마크의 위치에 대한 정보 관리
//    // private? -> 다음 단계에서 public computed property 사용 예정
//    private var coordinates: Coordinates
//
//    // MapKit 프레임워크와 상호 작용하는 데 유용한 속성 계산
//    var locationCoordinate: CLLocationCoordinate2D {
//        CLLocationCoordinate2D(
//            latitude: coordinates.latitude,
//            longitude: coordinates.longtitude)
//    }
//
//    // JSON 데이터 구조의 스토리지를 반영하는 중첩 coordinates 타입을 사용
//    struct Coordinates: Hashable, Codable {
//        var latitude: Double
//        var longtitude: Double
//    }
//}


import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
