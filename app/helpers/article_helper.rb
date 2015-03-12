module ArticleHelper
  # 記事一覧で１００文字以内に切り取った文字と続きを読むリンクをつける
  def article_description article
    output = h truncate(strip_tags(article.article), length: 100, omission: '...')
    output += link_to('▶続きを読む', article_path(article))
    output.html_safe
  end
end
