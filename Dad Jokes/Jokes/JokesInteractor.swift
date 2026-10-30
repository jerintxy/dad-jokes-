
final class JokesInteractor: JokesInteractorInputProtocol {
    weak var output: JokesInteractorOutputProtocol?

    private let jokes = [
        Joke(setup: "Why did the developer go broke?",
             punchline: "Because he used up all his cache!"),
        Joke(setup: "What's the object-oriented way to become wealthy?",
             punchline: "Inheritance!"),
        Joke(setup: "Why do programmers wear glasses?",
             punchline: "Because they can't C#!"),
        Joke(setup: "Why do programmers prefer dark mode?",
             punchline: "Because light attracts bugs!"),
        Joke(setup: "Why did the function break up with the variable?",
             punchline: "Because it felt like she was constantly changing!"),
        Joke(setup: "What do programmers do when they are cold?",
             punchline: "They sit near the firewall!"),
        Joke(setup: "Why was the computer cold?",
             punchline: "It left its Windows open!")
    ]

    private var index = 0

    func loadFirstJoke() {
        index = 0
        deliverCurrentJoke()
    }

    func loadNextJoke() {
        index = (index + 1) % jokes.count
        deliverCurrentJoke()
    }

    private func deliverCurrentJoke() {
        output?.didLoadJoke(jokes[index], isLast: index == jokes.count - 1)
    }
}
