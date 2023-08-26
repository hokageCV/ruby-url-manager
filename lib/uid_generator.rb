module UidGenerator
    extend self
  
    def generate_unique_code
      loop do
        code = generate_code
        return code unless ShortenedUrl.exists?(shortened_code: code)
      end
    end
  
    private
  
    def generate_code
      charset = Array('A'..'Z') + Array('a'..'z') + Array('0'..'9')
      Array.new(6) { charset.sample }.join
    end
end
  