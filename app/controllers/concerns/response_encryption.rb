module ResponseEncryption
  mattr_reader(:alphabet, instance_reader: false) { 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890~!@#$%^&*()_+-=/,.?|":;<>{}[]' }
  class << self
    def sorted_alphabet key
      tmp_alphabet = alphabet.split('')
      tmp_key = key.split('')
      length = tmp_alphabet.length

      length.times do |idx|
        index = length - idx
        i = index * index % alphabet.length
        if tmp_key[i % key.length] > tmp_alphabet[i]
          tmp =  tmp_alphabet[index]
          tmp_alphabet[index] = tmp_alphabet[i]
          tmp_alphabet[i] = tmp
        else
          tmp =  tmp_alphabet[index]
          tmp_alphabet[index] = tmp_alphabet[i]
          tmp_alphabet[i] = tmp
        end
      end
      tmp_alphabet.join('')
    end

    def remap (input, from, to)
      input_characters = input.split('')
      remapped_string = []

      input_characters.length.times do |i|
        character = input_characters[i]
        if to.include? character
          remapped_string.push(to[from.index(character)])
        else
          remapped_string.push(character)
        end
      end
      remapped_string.join('')
    end

    def encrypt text, key = 'zezeping'
      text = URI.encode(text)
      remap(text, alphabet, sorted_alphabet(key))
    end

    def decode text, key = 'zezeping'
      decodeText = remap(text, sorted_alphabet(key), alphabet)
      URI.decode(decodeText)
    end
  end
end