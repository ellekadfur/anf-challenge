//
//  ANF_Code_TestTests.swift
//  ANF Code TestTests
//


import XCTest
@testable import ANF_Code_Test

class ANFExploreCardTableViewControllerTests: XCTestCase {
    
    var testInstance: ANFExploreCardTableViewController!
    var testProducDetailInstance : ANFExploreCardDetailsViewController!
    override func setUp() {
        super.setUp()
        testInstance = UIStoryboard(name: "ExploreCard", bundle: nil).instantiateViewController(withIdentifier: "ANFExploreCardTableViewController") as? ANFExploreCardTableViewController
        
        testGetJson()
    }
    
    func testGetJson(){
        testInstance.getProductList()
        _ = XCTWaiter.wait(for: [expectation(description: "Wait for n seconds")], timeout: 5.0)
        XCTAssert(testInstance.productList.count != 0)
    }
    
    func test_numberOfSections_ShouldBeOne() {
        let numberOfSections = testInstance.numberOfSections(in: testInstance.tableView)
        XCTAssert(numberOfSections == 1, "table view should have 1 section")
    }
    
    func test_numberOfRows_ShouldBeTen() {
        let numberOfRows = testInstance.tableView(testInstance.tableView, numberOfRowsInSection: 0)
        XCTAssert(numberOfRows == testInstance.productList.count, "table view should have 10 cells")
    }
    
    func test_cellForRowAtIndexPath_titleText_shouldNotBeBlank() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? exploreContentCell
        let title = firstCell?.lblTitle
        XCTAssert(title?.text?.count ?? 0 > 0, "title should not be blank")
    }
    
    func test_cellForRowAtIndexPath_ImageViewImage_shouldNotBeNil() {
        let firstCell = testInstance.tableView(testInstance.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? exploreContentCell
        let imageView = firstCell?.ivBackground
        XCTAssert(imageView?.image != nil, "image view image should not be nil")
    }
}
