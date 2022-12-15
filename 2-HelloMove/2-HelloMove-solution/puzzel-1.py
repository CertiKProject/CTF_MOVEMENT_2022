from Crypto.Hash import keccak
import binascii
import sys

target = "d9ad5396ce1ed307e8fb2a90de7fd01d888c02950ef6852fbc2191d2baf58e79".encode("utf-8")

base = ["m", "o", "v", "e"]

for a in range(0 ,256):
    for b in range(0 ,256):
        for c in range(0 ,256):
            for d in range(0 ,256):
                guess = [chr(a), chr(b), chr(c), chr(d)] + base
                guess_input = "".join(guess).encode("utf-8")
                keccak256 = keccak.new(data=guess_input, digest_bits=256).digest()
                if binascii.hexlify(keccak256) == target:
                    print("Gotcha: ", a, b, c, d)
                    sys.exit(0)