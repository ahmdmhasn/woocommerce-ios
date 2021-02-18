import XCTest

@testable import WooCommerce
@testable import Yosemite

final class ProductFormActionsFactoryTests: XCTestCase {
    func testViewModelForPhysicalSimpleProductWithoutImages() {
        // Arrange
        let product = Fixtures.physicalSimpleProductWithoutImages
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .reviews,
                                                                       .shippingSettings(editable: true),
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = []
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForPhysicalSimpleProductWithImages() {
        // Arrange
        let product = Fixtures.physicalSimpleProductWithImages
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .reviews,
                                                                       .shippingSettings(editable: true),
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = []
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func test_viewModel_for_physical_simple_product_with_reviews_disabled() {
        // Arrange
        let product = Fixtures.physicalSimpleProductWithReviewsDisabled
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .shippingSettings(editable: true),
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = []
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func test_viewModel_for_product_without_linked_products_shows_editLinkedProducts_in_bottom_sheet() {
        // Arrange
        let product = Fixtures.physicalSimpleProductWithoutLinkedProducts
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .shippingSettings(editable: true),
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editLinkedProducts]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func test_viewModel_for_product_with_linked_products_shows_linkedProducts_action_in_settings_section() {
        // Arrange
        let product = Fixtures.physicalSimpleProductWithImages
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .reviews,
                                                                       .shippingSettings(editable: true),
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = []
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForDownloadableSimpleProduct() {
        // Arrange
        let product = Fixtures.downloadableSimpleProduct
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .reviews,
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .downloadableFiles(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = []
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForVirtualSimpleProduct() {
        // Arrange
        let product = Fixtures.virtualSimpleProduct
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .reviews,
                                                                       .inventorySettings(editable: true),
                                                                       .categories(editable: true),
                                                                       .tags(editable: true),
                                                                       .shortDescription(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = []
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForAffiliateProduct() {
        // Arrange
        let product = Fixtures.affiliateProduct
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.priceSettings(editable: true),
                                                                       .reviews,
                                                                       .externalURL(editable: true),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editSKU, .editCategories, .editTags, .editShortDescription]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForGroupedProduct() {
        // Arrange
        let product = Fixtures.groupedProduct
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.groupedProducts(editable: true),
                                                                       .reviews,
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: true)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editSKU, .editCategories, .editTags, .editShortDescription]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForVariableProductWithoutVariations() {
        // Arrange
        let product = Fixtures.variableProductWithoutVariations
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [
            .variations,
            .reviews,
            .shippingSettings(editable: true),
            .inventorySettings(editable: true),
            .linkedProducts(editable: true),
            .productType(editable: true)
        ]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editCategories, .editTags, .editShortDescription]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func testViewModelForVariableProductWithVariations() {
        // Arrange
        let product = Fixtures.variableProductWithVariations
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [
            .variations,
            .reviews,
            .shippingSettings(editable: true),
            .inventorySettings(editable: true),
            .linkedProducts(editable: true),
            .productType(editable: true)
        ]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editCategories, .editTags, .editShortDescription]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func test_actions_for_non_core_product_without_price() {
        // Arrange
        let product = Fixtures.nonCoreProductWithoutPrice
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [.reviews,
                                                                       .inventorySettings(editable: false),
                                                                       .linkedProducts(editable: true),
                                                                       .productType(editable: false)]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editCategories, .editTags, .editShortDescription]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }

    func test_actions_for_non_core_product_with_price() {
        // Arrange
        let product = Fixtures.nonCoreProductWithPrice
        let model = EditableProductModel(product: product)

        // Action
        let factory = ProductFormActionsFactory(product: model,
                                                formType: .edit)

        // Assert
        let expectedPrimarySectionActions: [ProductFormEditAction] = [.images(editable: true), .name(editable: true), .description(editable: true)]
        XCTAssertEqual(factory.primarySectionActions(), expectedPrimarySectionActions)

        let expectedSettingsSectionActions: [ProductFormEditAction] = [
            .priceSettings(editable: false),
            .reviews,
            .inventorySettings(editable: false),
            .linkedProducts(editable: true),
            .productType(editable: false)
        ]
        XCTAssertEqual(factory.settingsSectionActions(), expectedSettingsSectionActions)

        let expectedBottomSheetActions: [ProductFormBottomSheetAction] = [.editCategories, .editTags, .editShortDescription]
        XCTAssertEqual(factory.bottomSheetActions(), expectedBottomSheetActions)
    }
}

private extension ProductFormActionsFactoryTests {
    enum Fixtures {
        static let category = ProductCategory(categoryID: 1, siteID: 2, parentID: 6, name: "", slug: "")
        static let image = ProductImage(imageID: 19,
                                        dateCreated: Date(),
                                        dateModified: Date(),
                                        src: "https://photo.jpg",
                                        name: "Tshirt",
                                        alt: "")
        static let tag = ProductTag(siteID: 123, tagID: 1, name: "", slug: "")
        // downloadable: false, virtual: false, with inventory/shipping/categories/tags/short description
        static let physicalSimpleProductWithoutImages = MockProduct().product(downloadable: false, shortDescription: "desc", productType: .simple,
                                                                              manageStock: true, sku: "uks", stockQuantity: nil,
                                                                              dimensions: ProductDimensions(length: "", width: "", height: ""), weight: "2",
                                                                              virtual: false,
                                                                              categories: [category],
                                                                              tags: [tag],
                                                                              images: [])
        // downloadable: false, virtual: true, with inventory/shipping/categories/tags/short description
        static let physicalSimpleProductWithImages = MockProduct().product(downloadable: false, shortDescription: "desc", productType: .simple,
                                                                           manageStock: true, sku: "uks", stockQuantity: nil,
                                                                           dimensions: ProductDimensions(length: "", width: "", height: ""), weight: "2",
                                                                           virtual: false,
                                                                           categories: [category],
                                                                           tags: [tag],
                                                                           images: [image])
        // downloadable: false, virtual: true, reviews: false, with inventory/shipping/categories/tags/short description
        static let physicalSimpleProductWithReviewsDisabled = MockProduct().product(downloadable: false,
                                                                                    shortDescription: "desc", productType: .simple,
                                                                                    manageStock: true, sku: "uks", stockQuantity: nil,
                                                                                    dimensions: ProductDimensions(length: "", width: "", height: ""),
                                                                                    weight: "2",
                                                                                    virtual: false,
                                                                                    reviewsAllowed: false,
                                                                                    categories: [category],
                                                                                    tags: [tag],
                                                                                    images: [image])
        // downloadable: false, virtual: true, reviews: false, with inventory/shipping/categories/tags/short description
        static let physicalSimpleProductWithoutLinkedProducts = MockProduct().product(downloadable: false,
                                                                                    shortDescription: "desc", productType: .simple,
                                                                                    manageStock: true, sku: "uks", stockQuantity: nil,
                                                                                    dimensions: ProductDimensions(length: "", width: "", height: ""),
                                                                                    weight: "2",
                                                                                    virtual: false,
                                                                                    reviewsAllowed: false,
                                                                                    categories: [category],
                                                                                    tags: [tag],
                                                                                    images: [image],
                                                                                    upsellIDs: [],
                                                                                    crossSellIDs: [])
        // downloadable: false, virtual: true, with inventory/shipping/categories/tags/short description
        static let virtualSimpleProduct = MockProduct().product(downloadable: false, shortDescription: "desc", productType: .simple,
                                                                manageStock: true, sku: "uks", stockQuantity: nil,
                                                                dimensions: ProductDimensions(length: "", width: "", height: ""), weight: "2",
                                                                virtual: true,
                                                                categories: [category],
                                                                tags: [tag])
        // downloadable: true, virtual: true, missing inventory/shipping/categories/short description
        static let downloadableSimpleProduct = MockProduct().product(downloadable: true, shortDescription: "desc", productType: .simple,
                                                                     manageStock: true, sku: "uks", stockQuantity: nil,
                                                                     dimensions: ProductDimensions(length: "", width: "", height: ""), weight: "3",
                                                                     virtual: true,
                                                                     categories: [category],
                                                                     tags: [tag])
        // Affiliate product, missing external URL/sku/inventory/short description/categories/tags
        static let affiliateProduct = MockProduct().product(shortDescription: "",
                                                            externalURL: "",
                                                            productType: .affiliate,
                                                            sku: "",
                                                            categories: [],
                                                            tags: [])
        // Grouped product, missing grouped products/sku/short description/categories/tags
        static let groupedProduct = MockProduct().product(shortDescription: "",
                                                          productType: .grouped,
                                                          sku: "")
        // Variable product, missing variations/short description/categories/tags
        static let variableProductWithoutVariations = MockProduct().product(shortDescription: "",
                                                                            productType: .variable,
                                                                            sku: "").copy(variations: [])
        // Variable product with one variation, missing short description/categories/tags
        static let variableProductWithVariations = MockProduct().product(shortDescription: "",
                                                                         productType: .variable,
                                                                         sku: "").copy(variations: [123])
        // Non-core product, missing price/short description/categories/tags
        static let nonCoreProductWithoutPrice = MockProduct().product(shortDescription: "",
                                                                      productType: .custom("other")).copy(regularPrice: "")

        // Non-core product, missing short description/categories/tags
        static let nonCoreProductWithPrice = MockProduct().product(shortDescription: "",
                                                                   productType: .custom("other")).copy(regularPrice: "2")
    }
}
