require "yaml"

def load_library(emoticon_file)
      emoticons = YAML.load_file(emoticon_file)
      new_hash = {}
      emoticons.each do |key, val|
        new_hash[key] = {english: val[0], japanese: val[1]}
      end
      new_hash
end

def get_japanese_emoticon(emoticon_file, emoticon)
  emoticons = load_library(emoticon_file)
  
  emoticons.each do |key, val|
    if emoticon == val[:english]
      return val[:japanese]
    end
  end
  
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticon_file, emoticon)
  emoticons = load_library(emoticon_file)
  
  emoticons.each do |key, val| 
    if emoticon == val[:japanese]
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end