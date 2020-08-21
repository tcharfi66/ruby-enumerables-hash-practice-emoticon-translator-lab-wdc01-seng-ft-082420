require 'yaml'
def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end






def get_japanese_emoticon(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
      library["get_emoticon"].each do |english, japanese|
        if emoticon == english
          response = japanese
        end
      end
      if response == nil
          return "Sorry, that emoticon was not found"
        else
          return response
      end
end

def get_english_meaning(yaml_file, emoticon)
  library = load_library(yaml_file)
  response = nil
    library["get_meaning"].each do |emo, trans|
      if emo == emoticon
        response = trans
      end
    end
    if response == nil
      return "Sorry, that emoticon was not found"
    else
      return response
    end
end 