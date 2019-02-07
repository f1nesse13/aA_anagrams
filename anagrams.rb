def first_anagram?(str1, str2)
  all_variations = str1.chars.permutation.map(&:join)
  all_variations.include?(str2)
end
# first_anagram? increases exponetially with 3 letters having 6 possible combinations, 5 letters having 120 and 10 letters having a incredible 3628800  - O(kn) with more letters involving more variations on each letter
p first_anagram?('elvis', 'lives')


def second_anagram?(str1, str2)
  str2 = str2.split("")
  str1.chars.each do |chr|
    next if str2.find_index(chr) == nil
    idx = str2.find_index(chr)
    str2.delete_at(idx)
  end
  str2.join("") == ''
end
# second anagram is a O(n^2) complexity time wise - it has to iterate thru chars then again to find the index in the other string space complexity is O(1) since it doesn't store additional info only deletes chars from the second string
# p second_anagram?('elvis', 'lives')

def third_anagram?(str1, str2)
  str1.chars.sort! == str2.chars.sort!
end
# third anagram is O(n log n) since the sort method used by ruby has this complexity althrough if we were to expect larger arrays sort_by might be a better solution - the only other operation done is a comparision  and (2 memory accesses?) - space complexity is O(1)
# p third_anagram?('elvis', 'lives')

def fourth_anagram?(str1, str2)
  counter = Hash.new(0)
  strs = str1+str2
  strs.chars.each do |chr|
    counter[chr] += 1
  end
  counter.all? { |key, val| val == (str1.count(key) * 2) }
end
# fourth_anagram? is a O(n) function - it only has to loop thru a combination of both strings and makes sure that each value in the hash has a count equal to double each letter - the only way this is obtainable is if both strings have the same characters 
p fourth_anagram?('elvis', 'lives')


