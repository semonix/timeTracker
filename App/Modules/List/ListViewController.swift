import UIKit

protocol ListPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: ListViewProtocol? { get set }
    var interactor: ListInteractorProtocol! { get set }
    var router: ListRouterProtocol! { get set }
}

struct ItemData {
    
    let counter: Int
    let title: String
    let subtitile: String
    
    let eventType: EventType
    enum EventType {
        case future
        case completed
        var firstColor: UIColor {
            switch self {
            case .future:
                UIColor(red: 78.0/255.0, green: 203.0/255.0, blue: 194.0/255.0, alpha: 1)
            case .completed:
                UIColor(red: 255.0/255.0, green: 107.0/255.0, blue: 105.0/255.0, alpha: 1)
            }
        }
        var secondColor: UIColor {
            switch self {
            case .future:
                UIColor(red: 69.0/255.0, green: 161.0/255.0, blue: 142.0/255.0, alpha: 1)
            case .completed:
                UIColor(red: 237.0/255.0, green: 91.0/255.0, blue: 38.0/255.0, alpha: 1)
            }
        }
    }
}

class ListViewController: UIViewController {
    
    var presenter: ListPresenterProtocol!
    
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(GradientViewCell.self, forCellWithReuseIdentifier: GradientViewCell.identifier)
        
        return collectionView
    }()
    
    // MARK: - LAYOUT OF COLLECTION
    private func createLayout() -> UICollectionViewCompositionalLayout {
 
        let item = NSCollectionLayoutItem(layoutSize: .init(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(210)))
        item.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(
            widthDimension: .fractionalWidth(1), heightDimension: .estimated(250)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 8, leading: 8, bottom: 0, trailing: 8)
        section.interGroupSpacing = 20
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    private var itemsData: [ItemData] = []
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground

        setupNavigationBar()
        setupCollectionView()
        loadMockData()
    }
    private func setupNavigationBar() {
//        let titleLabel = UILabel()
//        titleLabel.text = "  Счётчики"
//        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.title = "Счётчики"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let rightButtonImage = UIImage(systemName: "plus.circle.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: rightButtonImage,
            style: .plain,
            target: self,
            action: #selector(addButtonTapped)
        )
        
//        let addButton = UIButton(type: .system)
//        let addButtonImage = UIImage(systemName: "plus")//?.withRenderingMode(.alwaysTemplate)
//        addButton.setImage(addButtonImage, for: .normal)
//        addButton.tintColor = .white
//        addButton.backgroundColor = .systemPurple.withAlphaComponent(0.7)
//        addButton.layer.cornerRadius = 12
//        addButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
//        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
    }
    
    // MARK: - ACTIONS
    @objc private func addButtonTapped() {
        print(#function)
    }
    
    private func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func loadMockData() {
        itemsData = [
            ItemData(counter: 42, title: "Концерт Metallica", subtitile: "дней до события", eventType: .future),
            ItemData(counter: 127, title: "Бросил курить", subtitile: "дней назад", eventType: .completed),
            ItemData(counter: 8, title: "Отпуск в Тайланде", subtitile: "дней до события", eventType: .future)
        ]
        collectionView.reloadData()
    }
}

// MARK: - DATA SOURCE
extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let itemData = itemsData[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GradientViewCell.identifier, for: indexPath) as! GradientViewCell
        cell.configure(with: itemData)
        return cell
    }
}
// MARK: - DELEGATE
extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
// MARK: - GRADIENT VIEW CELL
class GradientViewCell: UICollectionViewCell, GradientProtocol {
    /// GRADIENT'S PROPERTIES
    internal let gradient = CAGradientLayer()
    
    private var previousBounds: CGRect = .zero
    
//    init() {
//        super.init(frame: .zero)
//        setupCell()
//    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupCell()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds != previousBounds {
            previousBounds = contentView.bounds
            setupFrames()
        }
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /// CELL'S PROPERTIES
    static let identifier = "CollectionViewCell"
    
    private let counterLabel: UILabel = {
        let label = UILabel()
//        ultraLight
//        thin
//        light
//        regular
//        medium
//        semibold
//        bold
//        heavy
//        black
        label.font = .systemFont(ofSize: 65, weight: .heavy)
        label.textColor = .systemBackground
        return label
    }()
    private let minorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemBackground
        return label
    }()
    private let nameOfEventLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .systemBackground
        label.numberOfLines = 0
        return label
    }()
    private func setupCell() {
//        gradient.startPoint = defaultPoints[0]
//        gradient.endPoint = defaultPoints[1]
        contentView.layer.insertSublayer(gradient, at: 0)
        
        gradient.cornerRadius = 24
//        contentView.layer.cornerRadius = 12
        
        [counterLabel, nameOfEventLabel, minorLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        // MARK: - LAYOUT OF CELL
        NSLayoutConstraint.activate([
            counterLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            counterLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            counterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            minorLabel.topAnchor.constraint(equalTo: counterLabel.bottomAnchor, constant: -6),
            minorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            minorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            nameOfEventLabel.topAnchor.constraint(equalTo: minorLabel.bottomAnchor, constant: 8),
            nameOfEventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            nameOfEventLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            nameOfEventLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18)
        ])
    }
    func configure(with item: ItemData) {
        counterLabel.text = item.counter.description
        nameOfEventLabel.text = item.title
        minorLabel.text = item.subtitile
        
        setColors(start: item.eventType.firstColor, end: item.eventType.secondColor)
    }
}

extension ListViewController: ListViewProtocol {
    //  Что Presenter вызывает в View
    func updateValues() {
        // ...
    }
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: ListViewController())
}
