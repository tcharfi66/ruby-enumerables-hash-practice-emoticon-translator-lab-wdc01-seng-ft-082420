# require modules here

require 'yaml'


def load_library(emoticons)
 emoticons = YAML.load_file(file)
  library = {
    :get_meaning => {},
    :get_emoticon => {}
  }
  emoticons.each_pair{|key, value| 
    if library[:get_meaning]
      library[:get_meaning][value[1]] = key
    else
      library[:get_meaning] = { value[1] => key }
    end
    
    if library[:get_emoticon]
      library[:get_emoticon][value[0]] = value[1]
    else
      library[:get_emoticon] = { value[0] => value[1] }
    end
  }
  library
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