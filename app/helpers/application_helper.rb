module ApplicationHelper
  require 'bitly'

  def get_share_url(page_url) # あるページの短縮URLを生成するヘルパー
    Bitly.use_api_version_3
    bitly = Bitly.new('o_3drnmgb2qc', 'R_f17a499d205047aab9bf8906ce56482d')
    bitly.shorten(page_url).short_url
  end
end
