// The Swift Programming Language
// https://docs.swift.org/swift-book

// Public Interface

/*
 1. open : 모듈 외부에서 접근도 되고 override도 가능
 2. public : 모듈 외부에서 접근 가능 / override 안됨
 3. internal : 같은 모듈 안에서 접근 가능 (default)
 4. filePrivate : 서로 다른 선언부여도 같은 파일이면 사용 가능
 5. private
 
 access level을 따로 표시하지 않으면 internal
 */

import Foundation

/**
 박스오피스 관련 Public Interface를 제공하는 Main Class
 */
public class BoxOffices {
    private let apiClient: APIClient
    
    /*
     APIClient는 public interface가 아님, 즉, 외부에 노출하지 않음
     그렇기 때문에 APIClient가 api통신에 사용하는 key값을 외부 개발자들이 읽어올 수 있도록
     computed property 추가
     */
    /// 영화진흥위원회에서 발급 받은 API 키
    public var apiKey: String {
        apiClient.key
    }
    
    /**
     ``BoxOffices/BoxOffices`` 객체를 생성
     - Parameter key: 영화진흥위원회에서 발급 받은 API 키
     */
    public init(key: String) {
        self.apiClient = APIClient(key: key)
    }
    
    /**
     박스오피스 일별 탑10 영화를 가져옴
     - Returns: 성공할 시에는 ``Movie`` 타입의 영화 10개, 실패할 시에는 에러를 제공하는 ``Result`` 객체
     ``` swift
     let result = await boxOffices.fetchDailyTop10()
     switch result {
         case .success(let movies):
         // Movie 객체 10개
         case .failure(let error):
         // 에러 처리
     }
     ```
     */
    public func fetchDailyTop10() async -> Result<[Movie], Error> {
        // yesterday
        guard let yesterday = Date().yesterday else {
            return .failure(BoxOfficeError.recentDateIsInvalid)
        }
        
        // 날짜 형식: YYYYMMdd
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        let targetDate = dateFormatter.string(from: yesterday)

        // API 요청 & 응답
        do {
            // 이미 result에 Error를 던지기 때문에 throws를 사용하지 않고
            // do~catch로 핸들링
            let response: boxOfficeResponse = try await apiClient.fetch(
                path: "boxoffice/searchDailyBoxOfficeList.json",
                httpMethod: .get,
                queryItems: [URLQueryItem(name: "targetDt", value: targetDate)]
            )
            return .success(response.boxOfficeResult.dailyBoxOfficeList)
        } catch {
            return .failure(error)
        }
    }
}
