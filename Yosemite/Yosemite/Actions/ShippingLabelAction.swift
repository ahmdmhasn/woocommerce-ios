import Networking

public enum ShippingLabelAction: Action {
    /// Syncs shipping labels for a given order.
    ///
    case synchronizeShippingLabels(siteID: Int64, orderID: Int64, completion: (Result<Void, Error>) -> Void)

    /// Generates a shipping label document for printing.
    ///
    case printShippingLabel(siteID: Int64,
                            shippingLabelID: Int64,
                            paperSize: ShippingLabelPaperSize,
                            completion: (Result<ShippingLabelPrintData, Error>) -> Void)

    /// Requests a refund for a shipping label.
    ///
    case refundShippingLabel(shippingLabel: ShippingLabel,
                             completion: (Result<ShippingLabelRefund, Error>) -> Void)

    /// Loads the settings for a shipping label.
    ///
    case loadShippingLabelSettings(shippingLabel: ShippingLabel, completion: (ShippingLabelSettings?) -> Void)

    /// Validate a shipping address.
    ///
    case validateAddress(siteID: Int64,
                         address: ShippingLabelAddressVerification,
                         completion: (Result<ShippingLabelAddressValidationResponse, Error>) -> Void)
}
