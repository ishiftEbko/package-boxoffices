// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.
// 만약에 다른 개발자가 우리의 패키지를 사용할 때 개발자의 스위프트 버전보다 패키지의 스위프트 버전이 높으면 컴파일 에러가 발생해서 모듈을 사용하지 못함
// 즉, 스위프트 둘즈 버전에는 지원할 언어의 최소 버전을 넣어줘야 함
//

import PackageDescription

let package = Package(
    // 패키지 이름
    name: "BoxOffices",
    // 패키지를 지원할 플랫폼 버전 명시
    platforms: [.iOS(.v15)],
    products: [
        // 패키지가 제공할 프로덕트 정의
        // library와 executable이라는 실행파일이 프로덕트에 해당
        .library(
            // 다른 스위프트 코드에서 불러올 수 있는, import 할 수 있는 모듈을 가지고 있는 프로덕트
            name: "BoxOffices",
            targets: ["BoxOffices"]),
//        .executable(name: <#T##String#>, targets: <#T##[String]#>) // 실행파일
        // 윈도우에서 .exe 파일 같은 것으로, 시스템에 의해서 돌아가는 프로그램
        // 보통은 터미널에서 돌아가는 프로덕트를 제공할 때 .executable 사용
    ],
    dependencies: [
        // 하나 이상의 의존성 정의
        // dependencies에 정의된 의존성들은 각각 스스로를 위해 의존성을 또 가질 수 있으므로 의존성 그래프를 형성하게 됨
        // spm은 빌드를 실행하게 되면 필요한 모든 의존성들을 전부 다운로드 받고 컴파일 한 뒤에 의존성들을 패키지 모듈과 연결시킴
//        .package(url: <#T##String#>, from: <#T##Version#>) // url과 version 필요
    ],
    targets: [
        // 여러 타겟 추가 가능
        
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "BoxOffices"), // 타겟 이름
        // BoxOffices 에는 별도로 빌드할 소스 위치를 명시하지 않았기 때문에 자동으로 소스 폴더의 타겟 이름과 동일한 폴더 이름을 찾아서 그 안의 소스 파일들을 빌드함
        .testTarget(
            name: "BoxOfficesTests",
            dependencies: ["BoxOffices"]), // 필요한 의존성 명시
        // 테스트 할 때 BoxOffices의 코드를 테스트 해야 하기 때문에 dependencies에 명시하여 추가
        // 현재 패키지의 다른 타겟을 의존성으로 추가 가능
        
        // 정의된 타겟은 프로덕트에 포함시킬 수 있음
    ]
)
