//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Subeen on 2023/07/30.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        // 모델 데이터와 비교하여 입력 랜드마크의 인덱스를 계산
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)   // 맵 콘텐츠가 화면의 위쪽 가장자리까지 확장
                .frame(height: 300)
            
            // 이미지 원형으로 자르기
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // 랜드마크 정보 띄우기
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)   // `$`을 통해 `isFavorite`가 바인딩되게 함
                    // `modelData`와 `landmarkIndex`를 사용하여 버튼을 통해 `isFavorite`값이 업데이트되어 `modelData`에 업데이트될 수 있게 함.
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                
                Divider()   // 구분선
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
                
            }
            .padding()
        }
        .navigationTitle(landmark.name)
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
