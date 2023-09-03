module simple_aes

import crypto.cipher

fn split_array(data []u8, aes_cipher cipher.Block, process_chunk fn(cipher.Block, []u8) []u8) []u8 {
	mut index := aes_cipher.block_size
	mut chunk := []u8{}
	mut start := 0
	mut result_data := []u8{}

	data_length := data.len-1

	for {
		start = index - aes_cipher.block_size
		if index >= data.len { index = data.len }
		chunk = data[start..index].clone()


		if start < index { 
			result_data << process_chunk(aes_cipher, simple_aes.fix_chunk_length(chunk, aes_cipher.block_size))
		}

		if index > data_length {break}
		index += aes_cipher.block_size
	}
	return result_data
}

pub fn encrypt(aes_cipher cipher.Block, data []u8) []u8 {
	return split_array(data, aes_cipher, simple_aes.encrypt_chunk)
}

pub fn decrypt(aes_cipher cipher.Block, data []u8) []u8 {
	return remove_chunk_null_bytes(split_array(data, aes_cipher, simple_aes.decrypt_chunk), aes_cipher.block_size)
}
