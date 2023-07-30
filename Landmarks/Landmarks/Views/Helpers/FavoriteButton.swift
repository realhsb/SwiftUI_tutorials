//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Subeen on 2023/07/30.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool    // 바인딩 -> 이 보기 내에서 변경한 내용은 데이터 소스로 다시 전파.
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
