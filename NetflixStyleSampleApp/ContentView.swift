//
//  ContentView.swift
//  NetflixStyleSampleApp_SwiftUI
//
//  Created by 노민경 on 2022/01/27.
//

import SwiftUI

struct ContentView: View {
    let titles = ["Nexflix Sample App"]
    var body: some View {
        NavigationView {
            List(titles, id: \.self) {
                let nexflixVC = HomeViewControllerRepresentable()
                    .navigationBarHidden(true) // 리스트에 네비게이션바가 뜨지 않도록 숨김
                    .edgesIgnoringSafeArea(.all) // 전체 화면에 꽉 채울 수 있도록
               
                // 새로운 ViewController를 보여주었던 것과 같은 역할
                NavigationLink($0, destination: nexflixVC)
            }
            .navigationTitle("SwiftUI to UIKit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
