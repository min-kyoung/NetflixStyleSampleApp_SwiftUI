# NetflixStyleSampleApp_SwiftUI
## Description
기존에 UIKit을 이용하여 만들었던 NexflixStyleSampleApp을 SwiftUI로 감싸고 다시 SwiftUI로 연결해서 작동시킨다. <br>
기존에는 HomeViewController가 rootView가 되도록 했는데, 이 rootView 앞에 새로운 SwiftUI로 만든 rootView를 만들어 연결한다. <br>
그 rootView를 안에 list를 만들고, 그 list의 셀을 선택하면 기존에 만들었던 HomeViewController가 나오게 한다. <br>
그리고 HomeViewController에서 특정 아이템을 선택했을 때, SwiftUI로 만든 상세화면이 나타나게 한다. <br>
즉, SwiftUI - ViewController - SwiftUI의 구조로 만든다. <br>
<img src="https://user-images.githubusercontent.com/62936197/151314589-7cb2b258-e030-4134-b8eb-6874193b690c.png" width="150" height="320"> 　 　
<img src="https://user-images.githubusercontent.com/62936197/151314593-31c861d6-f135-4fa1-9843-f6ca82880326.png" width="150" height="320"> 　 　
<img src="https://user-images.githubusercontent.com/62936197/151314596-8d97faf1-a3d3-4eb1-97cc-e0f76d24f174.png" width="150" height="320"> <br> 　 　

## Files
>SceneDelegate.swift
  * HomViewController가 rootViewNavigationController로 설정되어 있는 것을 지우고 ContentView를 rootView로 설정한다.
    ```swift
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView) // SwiftUI에서 제공하는 view를 rootView로 둘 때
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    ```
>HomeViewController.swift
  * PreviewProvider를 사용하기 위해UIViewControllerRepresentable을 밖으로 빼주고 구조체 이름은 HomeViewControllerRepresentable로 변경한다.
    ```swift
    struct HomeViewController_Preview: PreviewProvider {
        static var previews: some View {
            HomeViewControllerRepresentable().edgesIgnoringSafeArea(.all)
        }
    }

    struct HomeViewControllerRepresentable: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            let layout = UICollectionViewLayout()
            let homeViewController = HomeViewController(collectionViewLayout: layout)

            return UINavigationController(rootViewController: homeViewController)
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        typealias UIViewControllerType = UIViewController
    }
    ```
  * 셀을 탭하면 상세 화면으로 넘어가도록 한다.
    ```swift
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      // 첫번째 섹션 클릭시 미리 만든 기본 화면이 표시되도록 함
      let isFirstSection = indexPath.section == 0
      let selectItem = isFirstSection ? mainItem
      : contents[indexPath.section].contentItem[indexPath.row]
        
      let contentDetailView = ContentDetailView(item: selectItem)
      let hostingVC = UIHostingController(rootView: contentDetailView)
      self.show(hostingVC, sender: nil)
    }
    ```
>ContentView.swift
  * rootView가 되는 화면
  * SwiftUI로 만들 것이기 때문에 User Interface 항목의 SwiftUI View로 파일을 생성한다.
  * List를 만들고 셀을 선택하면 HomeViewController로 넘어가도록 한다.
    ```swift
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
    ```
>ContentDetailViewHeader.swift
  * HomeViewController에서 아이템을 선택하면 넘어갈 상세 화면
  * Property Wrapper를 사용해서 이 view에 외부 자극 없이 내부의 상태가 어떻게 변화될 것이지를 표시하는 것을 만든다.
    ```swift
    import SwiftUI

    struct ContentDetailView: View {
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
    ```

