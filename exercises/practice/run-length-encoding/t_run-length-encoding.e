include std/unittest.e 

include run-length-encoding.ex 

set_test_verbosity(TEST_SHOW_ALL)

test_equal("encode empty string",
           "",
           encode(""))
test_equal("encode single characters without count",
           "XYZ",
           encode("XYZ"))
test_equal("encode string with no single characters",
           "2A3B4C",
           encode("AABBBCCCC"))
test_equal("encode single characters mixed with repeated characters",
           "12WB12W3B24WB",
           encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"))
test_equal("encode multiple whitespace mixed",
           "2 hs2q q2w2 ",
           encode("  hsqq qww  "))
test_equal("encode lowercase characters",
           "2a3b4c",
           encode("aabbbcccc"))
test_equal("decode empty string",
           "",
           decode(""))
test_equal("decode single characters only",
           "XYZ",
           decode("XYZ"))
test_equal("decode string with no single characters",
           "AABBBCCCC",
           decode("2A3B4C"))
test_equal("decode single characters with repeated characters",
           "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB",
           decode("12WB12W3B24WB"))
test_equal("decode multiple whitespace mixed",
           "  hsqq qww  ",
           decode("2 hs2q q2w2 "))
test_equal("decode lowercase string",
           "aabbbcccc",
           decode("2a3b4c"))
test_equal("encode followed by decode gives original string",
           "zzz ZZ  zZ",
           decode(encode("zzz ZZ  zZ")))

test_report()
