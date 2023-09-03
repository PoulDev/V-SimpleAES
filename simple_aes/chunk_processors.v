module simple_aes

import crypto.cipher

fn encrypt_chunk(aes_cipher cipher.Block, chunk []u8) []u8 {
    mut encrypted := []u8{len: aes_cipher.block_size}
	aes_cipher.encrypt(mut encrypted, chunk)
	return encrypted
}

fn decrypt_chunk(aes_cipher cipher.Block, chunk []u8) []u8 {
	mut decrypted := []u8{len: aes_cipher.block_size}
	aes_cipher.decrypt(mut decrypted, chunk)
	return decrypted
}
