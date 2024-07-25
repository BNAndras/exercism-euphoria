include std/convert.e
include std/regex.e as re
include std/sequence.e
include std/text.e

public function encode(sequence string)
  regex consecutiveChars = re:new(`([\w\s])\1*`)
  return re:find_replace_callback(consecutiveChars, string, routine_id("replace_count"))
end function

public function decode(sequence string)
  regex = countAndChar = re:new(`(\d+)(\w|\s)`)
  return re:find_replace(regex, string, routine_id("repeat_char"))
end function


function replace_count(match)
  if length(match) > 1 then
    return to_string(length(match))
  end if
  
  return sprintf("%s%s", {length(match), match})
end function

function repeat_char(sequence char, sequence times)
  return join(repeat(char, times), "")
end function