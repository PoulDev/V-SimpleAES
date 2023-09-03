module simple_aes

fn fix_chunk_length(value []u8, chunk_size int) []u8 {
	mut data := value.clone()
	bytes_to_add := chunk_size - data.len
	if bytes_to_add == 0 { return data }

	for _ in 0..bytes_to_add {
		data << 0
	}
	return data
}

fn remove_chunk_null_bytes(value []u8, chunk_size int) []u8 {
	mut last_chunk := value[value.len-chunk_size..].clone()
	mut cleaned_chunks := value[..value.len-chunk_size].clone()
	mut zero_index := last_chunk.index(0)
	zero_index = if zero_index == -1 { chunk_size } else { zero_index }

	cleaned_chunks << last_chunk[..zero_index] 
	return cleaned_chunks
}
