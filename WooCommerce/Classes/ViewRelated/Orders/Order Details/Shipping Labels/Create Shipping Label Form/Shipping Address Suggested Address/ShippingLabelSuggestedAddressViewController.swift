import UIKit
import Yosemite

final class ShippingLabelSuggestedAddressViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var useAddressButton: UIButton!
    @IBOutlet weak var editAddressButton: UIButton!

    /// Stack view that contains the top warning banner and is contained in the table view header.
    ///
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    /// Top banner that shows a warning in case there is an error in the address validation.
    ///
    private lazy var topBannerView: TopBannerView = {
        let topBanner = ShippingLabelSuggestedAddressTopBannerFactory.topBannerView()
        topBanner.translatesAutoresizingMaskIntoConstraints = false
        return topBanner
    }()

    private let type: ShipType
    private let address: ShippingLabelAddress?
    private let suggestedAddress: ShippingLabelAddress?
    private let sections: [Section] = [Section(rows: [.addressEntered, .addressSuggested])]

    /// Completion callback
    ///
    typealias Completion = (_ address: ShippingLabelAddress?) -> Void
    private let onCompletion: Completion

    /// Init
    ///
    init(type: ShipType, address: ShippingLabelAddress?, suggestedAddress: ShippingLabelAddress?, completion: @escaping Completion) {
        self.type = type
        self.address = address
        self.suggestedAddress = suggestedAddress
        onCompletion = completion
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureMainView()
        configureTableView()
        configureUseAddressButton()
        configureEditAddressButton()
    }

}

// MARK: - View Configuration
//
private extension ShippingLabelSuggestedAddressViewController {

    func configureNavigationBar() {
        title = type == .origin ? Localization.titleViewShipFrom : Localization.titleViewShipTo
        removeNavigationBackBarButtonText()
    }

    func configureMainView() {
        view.backgroundColor = .listBackground
    }

    func configureTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .listBackground
        tableView.separatorStyle = .singleLine
        tableView.removeLastCellSeparator()

        registerTableViewCells()

        tableView.dataSource = self

        // Configure header container view
        let headerContainer = UIView(frame: CGRect(x: 0, y: 0, width: Int(tableView.frame.width), height: 0))
        headerContainer.addSubview(topStackView)
        headerContainer.pinSubviewToSafeArea(topStackView)
        topStackView.addArrangedSubview(topBannerView)

        tableView.tableHeaderView = headerContainer
        tableView.updateHeaderHeight()
    }

    func registerTableViewCells() {
        for row in Row.allCases {
            tableView.registerNib(for: row.type)
        }
    }

    func configureUseAddressButton() {
        useAddressButton.setTitle(Localization.useAddressSuggestedButton, for: .normal)
        //useAddressButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        useAddressButton.applySecondaryButtonStyle()
    }

    func configureEditAddressButton() {
        editAddressButton.setTitle(Localization.editAddressButton, for: .normal)
        //editAddressButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        editAddressButton.applySecondaryButtonStyle()
    }
}

// MARK: - UITableViewDataSource Conformance
//
extension ShippingLabelSuggestedAddressViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.type.reuseIdentifier, for: indexPath)
        configure(cell, for: row, at: indexPath)

        return cell
    }
}

// MARK: - Cell configuration
//
private extension ShippingLabelSuggestedAddressViewController {
    /// Cells currently configured in the order they appear on screen
    ///
    func configure(_ cell: UITableViewCell, for row: Row, at indexPath: IndexPath) {
        switch cell {
        case let cell as BasicTableViewCell where row == .addressEntered:
            configureAddressEntered(cell: cell, row: row)
        case let cell as BasicTableViewCell where row == .addressSuggested:
            configureAddressSuggested(cell: cell, row: row)
        default:
            fatalError("Cannot instantiate \(cell) with row \(row.type)")
            break
        }
    }

    func configureAddressEntered(cell: BasicTableViewCell, row: Row) {
        cell.textLabel?.text = address?.fullNameWithCompanyAndAddress
    }

    func configureAddressSuggested(cell: BasicTableViewCell, row: Row) {
        cell.textLabel?.text = suggestedAddress?.fullNameWithCompanyAndAddress
    }
}

extension ShippingLabelSuggestedAddressViewController {

    struct Section: Equatable {
        let rows: [Row]
    }

    enum Row: CaseIterable {
        case addressEntered
        case addressSuggested

        fileprivate var type: UITableViewCell.Type {
            switch self {
            case .addressEntered, .addressSuggested:
                return BasicTableViewCell.self
            }
        }

        fileprivate var reuseIdentifier: String {
            return type.reuseIdentifier
        }
    }
}

private extension ShippingLabelSuggestedAddressViewController {
    enum Localization {
        static let titleViewShipFrom = NSLocalizedString("Ship from", comment: "Shipping Label Address Validation navigation title")
        static let titleViewShipTo = NSLocalizedString("Ship to", comment: "Shipping Label Address Validation navigation title")
        static let useAddressEnteredButton = NSLocalizedString("Use Address Entered",
                                                               comment: "Action to use the address in Shipping Label Suggested screen as entered")
        static let useAddressSuggestedButton = NSLocalizedString("Use Suggested Address",
                                                                 comment: "Action to use the address in Shipping Label Suggested screen as suggested")
        static let editAddressButton = NSLocalizedString("Edit Address", comment: "Action to edit the address in Shipping Label Suggested screen")
    }

    enum Constants {
        static let headerContainerInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
