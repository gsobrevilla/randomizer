echo "\n\nExecuting generate.sh"
echo "\n[babelish] Localizable.csv --> Localizable.strings"
babelish csv2strings
echo "\n[swiftgen] Localizable.strings --> Localizable.swift"
Pods/SwiftGen/bin/swiftgen
echo "\n"