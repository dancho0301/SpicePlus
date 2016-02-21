module MainHelper
  # 記事一覧で１００文字以内に切り取った文字と続きを読むリンクをつける
  def article_description article
    output = h truncate(strip_tags(article.article), length: 100, omission: '...')
    output += link_to('▶続きを読む', article_path(article))
    output.html_safe
  end

  def get_article_photo_path article
    if article.genre_id == 0
      OtherArticle.find(article.id).photo
    else
      Article.find(article.id).photo
    end
  end

  def get_article_path article
    if article.genre_id == 0
      other_article_path(article.id)
    else
      article_path(article.id)
    end
  end

  def get_article_genre_name article
    if article.genre_id == 0
      "その他"
    else
      article_path(article.id)
    end
  end

end
