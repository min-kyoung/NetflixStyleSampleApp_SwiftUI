# NetflixStyleSampleApp
## Description
Nexflix 앱을 참고하여 영화 콘텐츠를 보여주는 샘플 앱을 제작하느 프로젝트이다. <br>
UICollectionView를 이용하여 서로 다른 크기와 형태를 가진 셀을 세로 방향으로 컨셉을 나누고, 각각의 컨셉에 속한 콘텐츠들은 가로 방향 스크롤 리스트로 보여준다. <br>
<img src="https://user-images.githubusercontent.com/62936197/150627314-f5a23906-6b31-4542-8f8d-7c21013021f9.png" width="150" height="320"> 　 　
<img src="https://user-images.githubusercontent.com/62936197/150627316-a62c088b-e26d-4eea-b30d-c3c909b2f1bd.png" width="150" height="320">

## Prerequisite
스토리보드를 사용하지 않고 코드로 작성하여 사용할 예정이기 때문에 이를 위한 초기 셋팅이 필요하다.
1. 프로젝트 생성 시 기존에 만들어졌던 ViewController.swift와 Main.storyboard를 삭제한다.
2. info.plist에 있는 두 항목을 삭제한다.
   <img src="https://user-images.githubusercontent.com/62936197/149618014-9c2a58e8-9bb7-49f7-8552-1f381a08b63a.png" width="700" height="130">
   <img src="https://user-images.githubusercontent.com/62936197/149618059-abea1cef-5272-4abf-bfa2-ae300ab9def0.png" width="700" height="20">
3. UI를 쉽기 그리기 위해 SnapKit를추가한다. <br>
  **File > Swift Packages > Add Package Dependency**에서 설치
    ```
    https://github.com/SnapKit/SnapKit.git
    ```
## Files
>HomeViewController.swift
  *
>UIButton.swift
  *
>ContentCollectionViewCell.swift
  *
>ContentCollectionViewHeader.swift
  *
>ContentCollectionViewRankCell.swift
  *
>ContentCollectionViewMainCell.swift
  *
