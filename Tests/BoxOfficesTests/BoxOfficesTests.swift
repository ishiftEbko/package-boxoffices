import XCTest
@testable import BoxOffices

final class BoxOfficesTests: XCTestCase {
    func test_fetchDailyTop10() async throws {
        let boxOffices = BoxOffices(key: "6be86e32039d27f8bbbd4c20d9b9e748")
        let result = await boxOffices.fetchDailyTop10()
        let topMovies = try result.get()
        XCTAssertEqual(topMovies.count, 10)
    }
}
