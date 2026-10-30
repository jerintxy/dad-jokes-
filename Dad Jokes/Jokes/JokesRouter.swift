
import UIKit

final class JokesRouter {
    static func createModule() -> UIViewController {
        let view = JokesViewController()
        let interactor = JokesInteractor()
        let presenter = JokesPresenter(view: view, interactor: interactor)
        interactor.output = presenter
        view.presenter = presenter
        return view
    }
}
