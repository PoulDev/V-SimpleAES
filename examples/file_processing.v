import simple_aes
import crypto.aes
import crypto.cipher
import rand
import os

fn write_file(file string, data []u8) bool {
	mut file_obj := os.create(file) or { return false }
	defer { file_obj.close() }

	file_obj.write(data) or { return false }
	return true
}

fn encrypt_file(aes_cipher cipher.Block, file string) {
	data := os.read_bytes(file) or { panic(err) }
	encrypted := simple_aes.encrypt(aes_cipher, data)
	write_file('encrypted_${file}', encrypted)
	println('Encrypted ${file} as encrypted_${file}')
}

fn decrypt_file(aes_cipher cipher.Block, file string) {
	data := os.read_bytes(file) or { panic(err) }
	decrypted := simple_aes.decrypt(aes_cipher, data)
	write_file('decrypted_${file}', decrypted)
	println('Decrypted ${file} as decrypted_${file}')
}

fn main() {
	key := rand.bytes(32)!
	aes_cipher := aes.new_cipher(key)

	encrypt_file(aes_cipher, 'example_file.jpeg')
	decrypt_file(aes_cipher, 'encrypted_example_file.jpeg')
}
