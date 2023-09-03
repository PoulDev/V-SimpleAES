# V SimpleAES

> ### Why I wrote simple_aes?
> I wanted to write a simple library that can be easily imported into my code to simplify the usage of AES in VLang. This is because the implementation provided by the built-in `crypto.aes` library does not support data of lengths greater or smaller than the AES block size (16 bytes).

```vlang
import simple_aes
import crypto.aes
import rand

fn main() {
	aes_cipher := aes.new_cipher(rand.bytes(32)!)
	data := 'Secret data that you want to encrypt'.bytes()

	encrypted := simple_aes.encrypt(aes_cipher, data)
	decrypted := simple_aes.decrypt(aes_cipher, encrypted)
}
```

You can find some examples in the [/examples folder](/examples)
