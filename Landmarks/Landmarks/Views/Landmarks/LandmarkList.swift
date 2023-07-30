//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Subeen on 2023/07/30.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    // `environmentObject`가 부모에 적용되고 있는 한, `modelData` 프로퍼티는 값을 자동으로 가져온다.
    
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        // `landmarks`를 필터링할 때 `modelData`를 사용한다
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        
        // Landmark에 Identifiable 프로토콜 적용 전
//        List(landmarks, id: \.id) { landmark in
//            LandmarkRow(landmark: landmark)
//        }
        
        // Landmark에 Identifiable 프로토콜 적용 후
        // able to use collections of `Landmark` elements directly.
        NavigationStack {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }

                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        
//        ForEach(["iPhone SE (3nd generation)", "iPhone 11", "iPad (10th generation)"], id: \.self) { deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
