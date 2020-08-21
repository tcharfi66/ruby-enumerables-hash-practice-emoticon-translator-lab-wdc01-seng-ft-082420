require 'yaml'

def load_library (file_path)
  require "yaml"
  emojis = YAML.load_file(file_path)
  translator_hash = {:get_meaning => {}, :get_emoticon => {}}
  emojis.each do |meaning_key, emoticons_value|
    (translator_hash[:get_meaning])[emoticons_value[1]] = meaning_key
    (translator_hash[:get_emoticon])[emoticons_value[0]] = emoticons_value[1]
  end
return translator_hash
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