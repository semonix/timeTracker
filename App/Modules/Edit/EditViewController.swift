import UIKit

protocol EditPresenterProtocol {
    // Что View вызывает в Presenter
}

class EditViewController: UIViewController {
    
    var presenter: EditPresenterProtocol!
    
    let scrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    let stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
//        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
        let flexibleSpacer1 = {
            let flexibleSpacer1 = UIView()
            return flexibleSpacer1
        }()
    
        let eventNameView = {
           let eventNameView = UIView()
            return eventNameView
        }()
            let eventNameLabel = {
                let eventNameLabel = UILabel()
                eventNameLabel.text = "Название события"
                return eventNameLabel
            }()
            let eventNameTextField = {
                let eventNameTextField = UITextField()
                return eventNameTextField
            }()
    
        let flexibleSpacer2 = {
            let flexibleSpacer2 = UIView()
            return flexibleSpacer2
        }()
        
        let eventDateView = {
            let eventDateView = UIView()
            return eventDateView
        }()
            let eventDateLabel = {
                let eventDateLabel = UILabel()
                eventDateLabel.text = "Дата события"
                return eventDateLabel
            }()
            let eventDatePicker = {
                let eventDatePicker = UIDatePicker()
                eventDatePicker.preferredDatePickerStyle = .inline
                eventDatePicker.datePickerMode = .date
                return eventDatePicker
            }()
    
        let flexibleSpacer3 = {
            let flexibleSpacer3 = UIView()
            return flexibleSpacer3
        }()

            let eventTypeView = {
                let eventTypeView = UIView()
                return eventTypeView
            }()
                let eventTypeLabel = {
                    let eventTypeLabel = UILabel()
                    eventTypeLabel.text = "Тип события"
                    return eventTypeLabel
                }()
                let eventTypeSegmentControll = {
                    let eventTypeSegmentControll = UISegmentedControl()
                    return eventTypeSegmentControll
                }()
        let flexibleSpacer4 = {
            let flexibleSpacer4 = UIView()
            return flexibleSpacer4
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addSubViews()
        setupConstraints()
        toPaintViews()
    }
    
    func addSubViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        [flexibleSpacer1,
         eventNameView,
         flexibleSpacer2,
         eventDateView,
         flexibleSpacer3,
         eventTypeView,
         flexibleSpacer4,].forEach { someView in
            stackView.addArrangedSubview(someView)
        }
        
        eventNameView.addSubview(eventNameLabel)
        eventNameView.addSubview(eventNameTextField)
        
        eventDateView.addSubview(eventDateLabel)
        eventDateView.addSubview(eventDatePicker)
        
        eventTypeView.addSubview(eventTypeLabel)
        eventTypeView.addSubview(eventTypeSegmentControll)
        
    }
    
    func setupConstraints() {
        
        [scrollView,
            stackView,
                flexibleSpacer1,
                eventNameView,
                    eventNameLabel,
                    eventNameTextField,
                flexibleSpacer2,
                eventDateView,
                    eventDateLabel,
                    eventDatePicker,
                flexibleSpacer3,
                eventTypeView,
                    eventTypeLabel,
                    eventTypeSegmentControll,
                flexibleSpacer4].forEach { someView in
                    someView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            stackView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            flexibleSpacer1.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            flexibleSpacer2.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            flexibleSpacer3.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            flexibleSpacer4.heightAnchor.constraint(greaterThanOrEqualToConstant: 1),
            flexibleSpacer1.heightAnchor.constraint(equalTo: flexibleSpacer2.heightAnchor),
            flexibleSpacer2.heightAnchor.constraint(equalTo: flexibleSpacer3.heightAnchor),
            flexibleSpacer3.heightAnchor.constraint(equalTo: flexibleSpacer4.heightAnchor),
            
            eventNameLabel.topAnchor.constraint(equalTo: eventNameView.topAnchor),
            eventNameLabel.leadingAnchor.constraint(equalTo: eventNameView.leadingAnchor),
            eventNameLabel.trailingAnchor.constraint(equalTo: eventNameView.trailingAnchor),
            
            eventNameTextField.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor),
            eventNameTextField.leadingAnchor.constraint(equalTo: eventNameView.leadingAnchor),
            eventNameTextField.trailingAnchor.constraint(equalTo: eventNameView.trailingAnchor),
            eventNameTextField.bottomAnchor.constraint(equalTo: eventNameView.bottomAnchor),
            eventNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            eventDateLabel.topAnchor.constraint(equalTo: eventDateView.topAnchor),
            eventDateLabel.leadingAnchor.constraint(equalTo: eventDateView.leadingAnchor),
            eventDateLabel.trailingAnchor.constraint(equalTo: eventDateView.trailingAnchor),
            
            eventDatePicker.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor),
            eventDatePicker.leadingAnchor.constraint(equalTo: eventDateView.leadingAnchor),
            eventDatePicker.trailingAnchor.constraint(equalTo: eventDateView.trailingAnchor),
            eventDatePicker.bottomAnchor.constraint(equalTo: eventDateView.bottomAnchor),
            eventDatePicker.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            eventTypeLabel.topAnchor.constraint(equalTo: eventTypeView.topAnchor),
            eventTypeLabel.leadingAnchor.constraint(equalTo: eventTypeView.leadingAnchor),
            eventTypeLabel.trailingAnchor.constraint(equalTo: eventTypeView.trailingAnchor),
            
            eventTypeSegmentControll.topAnchor.constraint(equalTo: eventTypeLabel.bottomAnchor),
            eventTypeSegmentControll.leadingAnchor.constraint(equalTo: eventTypeView.leadingAnchor),
            eventTypeSegmentControll.trailingAnchor.constraint(equalTo: eventTypeView.trailingAnchor),
            eventTypeSegmentControll.bottomAnchor.constraint(equalTo: eventTypeView.bottomAnchor),
            eventTypeSegmentControll.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    func toPaintViews() {
        view.backgroundColor = .systemYellow
//        scrollView.backgroundColor = .systemRed
//        stackView.backgroundColor = .systemGreen
//        flexibleSpacer1.backgroundColor = .systemBlue
        eventNameView.backgroundColor = .systemOrange
        eventNameLabel.backgroundColor = .systemBrown
        eventNameTextField.backgroundColor = .systemPink
//        flexibleSpacer2.backgroundColor = .systemPurple
        eventDateView.backgroundColor = .systemTeal
        eventDateLabel.backgroundColor = .systemIndigo
        eventDatePicker.backgroundColor = .systemMint
//        flexibleSpacer3.backgroundColor = .systemCyan
        eventTypeView.backgroundColor = .systemGray
        eventTypeLabel.backgroundColor = .systemRed
        eventTypeSegmentControll.backgroundColor = .systemGreen
//        flexibleSpacer4.backgroundColor = .systemBlue
    }
    
}

extension EditViewController: EditViewProtocol {
    // Что Presenter вызывает во View
}

@available(iOS 17.0, *)
#Preview {
    UINavigationController(rootViewController: EditViewController())
}
