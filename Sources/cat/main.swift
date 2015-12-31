#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

import libutil

func do_cat(file_descriptor: CInt) {
	let buffer = Data(capacity: 255)

	while true {
		let count = read(file_descriptor, buffer.bytes, buffer.capacity)
		if count < 1 { break }
		write(1, buffer.bytes, count)
	}
}

func loop_over(files: [String], handler: (CInt) -> ()) {
	for file in files {
		let file_descriptor = open(file, O_RDONLY)
		handler(file_descriptor)
		close(file_descriptor)
	}
}

let args = Array(Process.arguments[1..<Process.arguments.count])
loop_over(args, handler: do_cat)
