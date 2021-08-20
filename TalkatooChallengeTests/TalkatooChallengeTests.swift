//
//  TalkatooChallengeTests.swift
//  TalkatooChallengeTests
//
//  Created by mskmatt on 19/08/2021.
//

import XCTest
@testable import TalkatooChallenge

class TalkatooChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_given0point0Double_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDouble: Double = 0
        let zeroDollarsString = zeroDouble.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.00")
    }

    func test_given10982point0Double_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDouble: Double = 10982
        let zeroDollarsString = zeroDouble.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$10,982.00")
    }

    func test_given0point01Double_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDouble: Double = 0.01
        let zeroDollarsString = zeroDouble.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.01")
    }

    func test_given0point001Double_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDouble: Double = 0.001
        let zeroDollarsString = zeroDouble.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.00")
    }

    func test_given0point006Double_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDouble: Double = 0.006
        let zeroDollarsString = zeroDouble.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.01")
    }

    func test_given10point0Double_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDouble: Double = 10
        let zeroDollarsString = zeroDouble.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$10.00")
    }
}
