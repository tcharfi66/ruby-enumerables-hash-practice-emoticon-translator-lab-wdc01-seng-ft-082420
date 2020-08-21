require "yaml"
require 'pry'# require modules here

def load_library(emoticon_files)
  emoticons = YAML.load_file(emoticon_files)
  new_hash = {}
  emoticons.each do |key, value|
    new_hash[key] = {english: value[0], japanese: value[1]}
 end
 new_hash
 end

def get_japanese_emoticon(emoticon_files, emoticon)
  emoticons = load_library(emoticon_files)
  emoticons.each do |key, value|
    if emoticon == value[:english]
      return value[:japanese]
  end
end
return "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticon_files, emoticon)
  emoticons = load_library(emoticon_files)
  emoticons.each do |key, value| 
    if emoticon == value[:japanese]
      return key
  end
end
return "Sorry, that emoticon was not found"
end