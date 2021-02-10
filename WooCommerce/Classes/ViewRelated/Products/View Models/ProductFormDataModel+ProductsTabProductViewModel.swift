import Foundation

/// Helpers for `ProductsTabProductViewModel` from `ProductFormDataModel`.
extension ProductFormDataModel {
    /// Create a description text based on a product data model's stock status/quantity.
    func createStockText() -> String {
        switch stockStatus {
        case .inStock:
            if let stockQuantity = stockQuantity, manageStock {
                let format = NSLocalizedString("%@ in stock", comment: "Label about product's inventory stock status shown on Products tab")
                return String.localizedStringWithFormat(format, stockQuantity.description)
            } else {
                return NSLocalizedString("In stock", comment: "Label about product's inventory stock status shown on Products tab")
            }
        default:
            return stockStatus.description
        }
    }
}
