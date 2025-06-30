import UIKit

protocol DetailPresenterProtocol {
    //  Что View вызывает в Presenter
    var view: DetailViewProtocol? { get set }
    var interactor: InteractorProtocol! { get set }
    var router: RouterProtocol! { get set }
}

class DetailViewController: UIViewController {
    
    var presenter: DetailPresenterProtocol!
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBlue
        return scrollView
    }()
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .systemCyan
        return stackView
    }()
    var mainView: UIView = {
        let view = UIView()
        return view
    }()
    var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        // sRGB:
        let upperLeftCornerColor = UIColor(red: 103.0/255.0, green: 127.0/255.0, blue: 235.0/255.0, alpha: 1)
        let lowerRightCornerColor = UIColor(red: 116.0/255.0, green: 73.0/255.0, blue: 160.0/255.0, alpha: 1)
        let colors = [upperLeftCornerColor.cgColor, lowerRightCornerColor.cgColor]
        gradient.colors = colors
//        gradient.needsDisplayOnBoundsChange = true
        return gradient
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addSubviews()
        setupConstraints()
    }
    func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(mainView)
        mainView.layer.insertSublayer(gradient, at: 0)
    }
    func setupConstraints() {
        [scrollView, stackView, mainView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            mainView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainView.layoutIfNeeded()
        gradient.frame = mainView.bounds
    }
}

extension DetailViewController: DetailViewProtocol {
    //  Что Presenter вызывает в View
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: DetailViewController())
}
