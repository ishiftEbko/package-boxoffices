# BoxOffices

영화진흥위원회에서 제공하는 API를 활용해 영화 관련 정보를 가져오는 Swift Package

## Overview

`BoxOffices` 는 [영화진흥위원회](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do) 에서 제공하는 API를 통해 영화 관련 정보들을 쉽게 가져올 수 있게 합니다. 

### 제공하는 기능
현재 제공하는 기능은 다음과 같습니다. 
- 상위 10개 박스오피스 목록 가져오기

### 지원 버전
- Swift 5.10
- iOS 15+

> IMPORTANT: 사용 전 반드시 영화진흥위원회에서 API 키를 발급 받아야 합니다. 영화진흥위원회 > 로그인 > 키 발급/관리

## 시작하기

 [영화진흥위원회](https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do) 에서 발급 받은 API 키를 가지고 `BoxOffices` 객체를 생성합니다. 

```swift
extension BoxOffices {
    static var shared: BoxOffices {
        BoxOffices(apiKey: "(발급_받은_API_키)")
    }
}
```

## 주요 기능

### 상위 10개 박스오피스 목록 가져오기 
일일 상위 10개 박스오피스 정보를 가져옵니다. 자세한 내용은 `BoxOffices/fetchDailyTop10` 메소드의 API Description을 참고해주세요.

> NOTE: 당일의 순위가 아닌 전날의 순위 정보를 가져옵니다.

## 기여하기
오픈소스 프로젝트이기 때문에 기여는 늘 환영입니다. 
구체적인 기여 방법 제시 가능
- 레포지토리 포크 후 수정해서 pr로 올려주시면 리뷰를 통해 코드 반영 가능
