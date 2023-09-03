module simple_aes

pub fn stringify(array []u8) string {
	mut str := ''
	for chr in array { str += rune(chr).str() }
	return str
}
