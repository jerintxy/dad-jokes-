
final class JokesPresenter: JokesPresenterProtocol, JokesInteractorOutputProtocol {
    weak var view: JokesViewProtocol?
    private let interactor: JokesInteractorInputProtocol

    private var currentJoke: Joke?
    private var isLastJoke = false

    init(view: JokesViewProtocol, interactor: JokesInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }

    // MARK: - JokesPresenterProtocol

    func viewDidLoad() {
        interactor.loadFirstJoke()
    }

    func didTapShowPunchline() {
        guard let joke = currentJoke else { return }
        view?.showJoke(setup: joke.setup, punchline: joke.punchline, isPunchlineVisible: true)
        if isLastJoke {
            view?.showMessage(title: "That's the last one!", message: "Tap anywhere to start over.")
        }
    }

    func didTapNext() {
        interactor.loadNextJoke()
    }

    // MARK: - JokesInteractorOutputProtocol

    func didLoadJoke(_ joke: Joke, isLast: Bool) {
        currentJoke = joke
        isLastJoke = isLast
        view?.showJoke(setup: joke.setup, punchline: joke.punchline, isPunchlineVisible: false)
    }
}
