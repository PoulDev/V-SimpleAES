import simple_aes
import crypto.aes
import encoding.base64
import rand

fn main() {
	key := rand.bytes(32)!
	aes_cipher := aes.new_cipher(key)
	data := 'Secret data that you want to encrypt'.bytes()

	println('Original Data: ${data}')

	encrypted := simple_aes.encrypt(aes_cipher, data)
	decrypted := simple_aes.decrypt(aes_cipher, encrypted)

	println('(Base64) Encrypted Data: ${base64.encode(encrypted)}')
	println('(string) Decrypted Data: ${simple_aes.stringify(decrypted)}')

	assert data == decrypted
}
