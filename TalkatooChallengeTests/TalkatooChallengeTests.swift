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

    func test_given0point0Decimal_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDecimal: Decimal = 0
        let zeroDollarsString = zeroDecimal.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.00")
    }

    func test_given10982point0Decimal_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDecimal: Decimal = 10982
        let zeroDollarsString = zeroDecimal.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$10,982.00")
    }

    func test_given0point01Decimal_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDecimal: Decimal = 0.01
        let zeroDollarsString = zeroDecimal.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.01")
    }

    func test_given0point001Decimal_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDecimal: Decimal = 0.001
        let zeroDollarsString = zeroDecimal.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.00")
    }

    func test_given0point006Decimal_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDecimal: Decimal = 0.006
        let zeroDollarsString = zeroDecimal.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$0.01")
    }

    func test_given10point0Decimal_whenConvertedToDollarString_thenValidateFormat() throws {
        let zeroDecimal: Decimal = 10
        let zeroDollarsString = zeroDecimal.toDollarsString()
        XCTAssertEqual(zeroDollarsString, "$10.00")
    }

    func test_given0Dollars_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 0
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown = ChangeBreakdown()

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_given0Dollars1Cent_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 0.01
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown = ChangeBreakdown(pennies: 1)

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_given1Dollar_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 1
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown = ChangeBreakdown(loonies: 1)

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_given3Dollars3Cents_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 3.03
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown = ChangeBreakdown(pennies: 3, loonies: 1, toonies: 1)

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_given356Dollars34Cents_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 356.34
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown = ChangeBreakdown(fives: 1, fifties: 1, hundreds: 3, pennies: 4, nickles: 1, quarters: 1, loonies: 1)

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_given0Dollars35Cents_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 0.35
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown = ChangeBreakdown(dimes: 1, quarters: 1)

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_givenNegative_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = -10.35
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown: ChangeBreakdown? = nil

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }

    func test_given1Dollar10Cents_whenCalculateChangeBreakdown_thenValidate() throws {
        let changeDue: Decimal = 1.10
        let calculatedChangeBreakdown = ChangeBreakdown(changeDue: changeDue)
        let expectedChangeBreakdown: ChangeBreakdown? = ChangeBreakdown(dimes: 1, loonies: 1)

        XCTAssertEqual(calculatedChangeBreakdown, expectedChangeBreakdown)
    }
}
