module Atoi
  # @param {String} s
  # @return {Integer}
  def atoi(s)
    negative, numeric = extract_numeric_value(s)
    return 0 if numeric.empty?
    parse_to_integer(negative, numeric)
  end

  DIGIT_TO_INT_MAP = {
    "0" => 0,
    "1" => 1,
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
  }
  VALID_NUMERICS = DIGIT_TO_INT_MAP.keys
  MAX_32 = 2147483648
  MIN_32 = -2147483648

  def parse_to_integer(negative, numeric)
    power = 1
    integer = 0

    i = numeric.length
    while i > 0
      digit = numeric[i-1]
      i = i - 1
      integer += DIGIT_TO_INT_MAP[digit] * power
      power = power * 10

      # Break out of the loop. No more need for computation.
      if integer > MAX_32
        i = -1
      end
    end

    integer = integer * -1 if negative

    if integer >= MAX_32
      MAX_32 - 1
    elsif integer < MIN_32
      MIN_32
    else
      integer
    end
  end

  def extract_numeric_value(s)
    numeric = ""
    negative = false
    already_signed = false

    s.strip.chars.each do |char|
      if VALID_NUMERICS.include?(char)
        numeric += char
      elsif char == "+"
        if numeric.length != 0
          break
        elsif already_signed == true
          return [false, ""]
        else
          already_signed = true
        end
      elsif char == "-"
        if numeric.length != 0
          break
        elsif already_signed == true
          return [false, ""]
        else
          negative = true
          already_signed = true
        end
      else
        break
      end
    end

    [negative, remove_leading_zeros(numeric)]
  end

  def remove_leading_zeros(numeric)
    leading_zeros = true
    value = ""

    numeric.chars.each do |s|
      if s == "0" && leading_zeros == true
        next
      else
        leading_zeros = false
        value += s
      end
    end

    value
  end
end