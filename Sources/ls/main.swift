import Commander
import Foundation

command() {
	let contents = try NSFileManager.defaultManager().contentsOfDirectoryAtPath(".")
	let notHiddenContents = contents.filter { !$0.hasPrefix(".") }
	notHiddenContents.forEach { print($0) }
}.run()
