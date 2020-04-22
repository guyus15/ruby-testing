$alphabet = "abcdefghijklmnopqrstuvwxyz"

def encrypt(text, offset)
    text.downcase.split("").each do |char|
        if $alphabet.include?(char) or $alphabet.upcase.include?(char)
            $alphabet.split("").each_with_index do |letter,index| 
                if letter == char
                    if index + offset > $alphabet.length
                        print $alphabet[index + offset - $alphabet.length]
                    else
                        print $alphabet[index + offset]
                    end
                end
            end
        else
            print char
        end
    end
end

encrypt("Hello, guyzzzz",-12)