module SitesHelper

  def parse_for_url(text)
    # The regex could probably still be improved, but this seems to do the
    # trick for most cases.
    text.gsub(/(https?:\/\/\w+(\.\w+)+(\/[\w\+\-\,\%]+)*(\?[\w\[\]]+(=\w*)?(&\w+(=\w*)?)*)?(#\w+)?)/i, '<a class="external" href="\1" target="_blank">\1</a>')
  end

end
