//
//  MyAppTests.swift
//  MyAppTests
//
//  Created by Bansi Mamtora on 26/08/22.
//

@testable import MyApp
import XCTest

class MyAppTests: XCTestCase {

    var loginViewModel: LoginViewModel!
        override func setUpWithError() throws {
            loginViewModel = LoginViewModel()
            // Put setup code here. This method is called before the invocation of each test method in the class.
        }

        override func tearDownWithError() throws {
            loginViewModel = nil
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        }

        func testExample() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.
        }
        
        func test_username_is_empty() throws {
            XCTAssertFalse(loginViewModel.validateData(username: "", password: "bansi306"), "Empty Email")
        }

        func test_password_is_empty() throws {
            XCTAssertFalse(loginViewModel.validateData(username: "mbansi", password: ""), "Empty Password")
        }
        
        func test_password_too_short() throws {
            XCTAssertFalse(loginViewModel.validateData(username: "mbansi", password: "ban"), "Password too short")
        }
        
        func test_valid_username_password() throws {
            XCTAssertTrue(loginViewModel.validateData(username: "mbansi", password: "bansi306"), "Email and Password is valid")
        }
}
