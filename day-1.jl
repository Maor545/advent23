# day - 1

#=
On each line, the calibration value can be found by combining the first digit and the last digit (in that order) to form a single two-digit number.

For example:

1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
In this example, the calibration values of these four lines are 12, 38, 15, and 77. Adding these together produces 142.

Consider your entire calibration document. What is the sum of all of the calibration values?
--- Part Two ---
Your calculation isn't quite right. It looks like some of the digits are actually spelled out with letters: one, two, three, four, five, six, seven, eight, and nine also count as valid "digits".

Equipped with this new information, you now need to find the real first and last digit on each line. For example:

two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
In this example, the calibration values are 29, 83, 13, 24, 42, 14, and 76. Adding these together produces 281.

=#
function extract_last_digit(input_string::AbstractString)
    num = match(r"(\d)(?!.*\d)", input_string)
    if num !== nothing
        return parse(Int, num.match)
    else
        0
    end
end

function extract_first_digit(input_string::AbstractString)
    num = match(r"\d", input_string)
    if num !== nothing
        return parse(Int, num.match)
    else
        0
    end
end

function string_to_number(input_string::AbstractString)
    input_string = replace(input_string, "one" => "one1one")
    input_string = replace(input_string, "two" => "two2two")
    input_string = replace(input_string, "three" => "three3three")
    input_string = replace(input_string, "four" => "four4four")
    input_string = replace(input_string, "five" => "five5five")
    input_string = replace(input_string, "six" => "six6six")
    input_string = replace(input_string, "seven" => "seven7seven")
    input_string = replace(input_string, "eight" => "eight8eight")
    input_string = replace(input_string, "nine" => "nine9nine")
    return input_string
end

out = 0
f = open("day1.txt", "r")
while ! eof(f)
    s = string_to_number(readline(f))
    global out = out + (10 * extract_first_digit(s)) + extract_last_digit(s)
end
close(f)

print(out)