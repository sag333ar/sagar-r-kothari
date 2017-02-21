### Installation

Using Homebrew

```
brew install swiftlint
```

You can also install SwiftLint by downloading SwiftLint.pkg from the latest "GitHub release and running it.

```
https://github.com/realm/SwiftLint/releases/latest
```

### Usage

Xcode

* Integrate SwiftLint into an Xcode scheme to get warnings and errors displayed in the IDE. 
* Just add a new "Run Script Phase" with:

```
if which swiftlint >/dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

### Ignore some rules

* Navigate to your project directory in finder.
* Create a file named `.swiftlint.yml`
* Put contents as follows.

 	
```yml
disabled_rules:
  - line_length
excluded:
  - Carthage
  - Pods
```

### Auto-correct code / auto-format code

* Open terminal
* Navigate to your project directory in terminal.
* Run following command

```sh
swiftlint autocorrect
```