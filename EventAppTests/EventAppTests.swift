//
//  EventAppTests.swift
//  EventAppTests
//
//  Created by betina farias on 04/07/19.
//  Copyright © 2019 betina farias. All rights reserved.
//

import XCTest
@testable import EventApp

class EventAppTests: XCTestCase {
    func testGetEventDetailEndpoint() {
        let route = EventsEndpoint.getEvent(id: "3")
        XCTAssertEqual(route.method, .GET)
        XCTAssertNotNil(route.path)
        XCTAssertEqual(route.path, "/events/3")
        XCTAssertNil(route.parameters)
    }
    
    func testGetEventListEndpoint() {
        let route = EventsEndpoint.getEvents
        XCTAssertEqual(route.method, .GET)
        XCTAssertNotNil(route.path)
        XCTAssertEqual(route.path, "/events")
        XCTAssertNil(route.parameters)
    }
    
    func testCheckinEndpoint() {
        let route = CheckinEndpoint.checkin(name: "Teste", email: "teste@teste.com", eventId: "3")
        XCTAssertEqual(route.method, .POST)
        XCTAssertNotNil(route.path)
        XCTAssertEqual(route.path, "/checkin")
        XCTAssertNotNil(route.parameters)
    }
}
