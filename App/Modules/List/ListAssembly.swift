import UIKit

class ListAssembly {
    static func createModule() -> UIViewController {
        let view = ListViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.interactorOutput = presenter
        router.view = view
        
        return view
    }
}
