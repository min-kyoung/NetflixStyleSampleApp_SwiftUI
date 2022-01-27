//
//  ContentDetailView.swift
//  NetflixStyleSampleApp_SwiftUI
//
//  Created by 노민경 on 2022/01/27.
//

import SwiftUI

// 상세 정보 화면
struct ContentDetailView: View {
    // Property Wrapper를 사용해서 이 view에 외부 자극 없이 내부의 상태가 어떻게 변화될 것이지를 표시하는 것을 만든다.
    @State var item: Item? // Item을 나타냄
    
    var body: some View {
        VStack {
            if let item = item {
                Image(uiImage: item.image)
                    .aspectRatio(contentMode: .fit)
                
                Text(item.description)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Color.white
            }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let item0 = Item(description: "흥미진진, 판타지, 애니메이션, 액션, 멀티캐스팅", imageName: "poster0")
        ContentDetailView(item: item0)
    }
}
