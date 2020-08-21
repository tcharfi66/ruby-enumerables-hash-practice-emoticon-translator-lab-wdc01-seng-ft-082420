# require modules here

require 'yaml'


def load_library(emoticons)
  emoticons = YAML.load_file(emoticons)
  emoticon_hash = {}
  emoticon_hash["get_meaning"] = {}
  emoticon_hash["get_emoticon"] = {}
  emoticons.each do |meaning,values|
    emoticon_hash["get_meaning"][values[1]] = meaning
    emoticon_hash["get_emoticon"][values[0]] = values[1]
  end
  emoticon_hash
end



def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(english_emoticon) 
    library["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end


def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  library = load_library(file_path)
  if library["get_meaning"].include?(japanese_emoticon) 
    library["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end 