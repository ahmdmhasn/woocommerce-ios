import XCTest
@testable import WooCommerce
@testable import Yosemite

final class ProductPriceSettingsViewModel_ProductVariationTests: XCTestCase {
    // MARK: - Sections

    typealias Section = ProductPriceSettingsViewModel.Section

    func testInitialSectionsWithoutSaleDates() {
        // Arrange
        let saleStartDate: Date? = nil
        let saleEndDate: Date? = nil
        let product = MockProductVariation().productVariation().copy(dateOnSaleStart: saleStartDate, dateOnSaleEnd: saleEndDate)
        let viewModel = ProductPriceSettingsViewModel(product: product)

        // Act
        let sections = viewModel.sections

        // Assert
        let initialSections: [Section] = [
            Section(title: Strings.priceSectionTitle, rows: [.price, .salePrice]),
            Section(title: nil, rows: [.scheduleSale]),
            Section(title: Strings.taxSectionTitle, rows: [.taxClass])
        ]
        XCTAssertEqual(sections, initialSections)
    }

    func testTappingScheduleSaleToRowTogglesPickerRowInSalesSection() {
        // Arrange
        let saleStartDate: Date? = nil
        let saleEndDate = Date()
        let product = MockProductVariation().productVariation().copy(dateOnSaleStart: saleStartDate, dateOnSaleEnd: saleEndDate)
        let viewModel = ProductPriceSettingsViewModel(product: product)
        let initialSections: [Section] = [
            Section(title: Strings.priceSectionTitle, rows: [.price, .salePrice]),
            Section(title: nil, rows: [.scheduleSale, .scheduleSaleFrom, .scheduleSaleTo, .removeSaleTo]),
            Section(title: Strings.taxSectionTitle, rows: [.taxClass])
        ]
        XCTAssertEqual(viewModel.sections, initialSections)

        // Act
        viewModel.didTapScheduleSaleToRow()
        let sectionsAfterTheFirstTap = viewModel.sections
        viewModel.didTapScheduleSaleToRow()
        let sectionsAfterTheSecondTap = viewModel.sections

        // Assert
        XCTAssertEqual(sectionsAfterTheFirstTap, [
            Section(title: Strings.priceSectionTitle, rows: [.price, .salePrice]),
            Section(title: nil, rows: [.scheduleSale, .scheduleSaleFrom, .scheduleSaleTo, .datePickerSaleTo, .removeSaleTo]),
            Section(title: Strings.taxSectionTitle, rows: [.taxClass])
        ])
        XCTAssertEqual(sectionsAfterTheSecondTap, initialSections)
    }

    func testRemovingSaleEndDateDeletesRemoveSaleToRow() {
        // Arrange
        let saleStartDate: Date? = nil
        let saleEndDate = Date()
        let product = MockProductVariation().productVariation().copy(dateOnSaleStart: saleStartDate, dateOnSaleEnd: saleEndDate)
        let viewModel = ProductPriceSettingsViewModel(product: product)
        let initialSections: [Section] = [
            Section(title: Strings.priceSectionTitle, rows: [.price, .salePrice]),
            Section(title: nil, rows: [.scheduleSale, .scheduleSaleFrom, .scheduleSaleTo, .removeSaleTo]),
            Section(title: Strings.taxSectionTitle, rows: [.taxClass])
        ]
        XCTAssertEqual(viewModel.sections, initialSections)

        // Act
        viewModel.handleSaleEndDateChange(nil)

        // Assert
        XCTAssertEqual(viewModel.sections, [
            Section(title: Strings.priceSectionTitle, rows: [.price, .salePrice]),
            Section(title: nil, rows: [.scheduleSale, .scheduleSaleFrom, .scheduleSaleTo]),
            Section(title: Strings.taxSectionTitle, rows: [.taxClass])
        ])
    }
}

private extension ProductPriceSettingsViewModel_ProductVariationTests {
    enum Strings {
        static let priceSectionTitle = NSLocalizedString("Price", comment: "Section header title for product price")
        static let taxSectionTitle = NSLocalizedString("Tax Settings", comment: "Section header title for product tax settings")
    }
}