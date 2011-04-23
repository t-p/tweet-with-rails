module SaveTweetsHelper

  def remove_brackets(text)
    text.gsub(/\[\"/, '')
  end
    
end
