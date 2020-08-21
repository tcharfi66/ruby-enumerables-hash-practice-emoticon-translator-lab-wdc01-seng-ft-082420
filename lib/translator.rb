require "yaml"

def load_library(file)
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

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  if library[:get_emoticon][emoticon]
    return library[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, meaning)
  library = load_library(file)
  if library[:get_meaning][meaning]
    return library[:get_meaning][meaning]
  else
    return "Sorry, that emoticon was not found"
  end
end