# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess # 追加

FactoryGirl.define do
  factory :article do
    title "先輩パパママと子育てゆる体験"
    publication_date "2015/07/01"
    description "NPO法人「びーのびーの」は、親子のひろば事業として、菊名・大倉山に「親子のひろば びーのびーの」と「港北区子育て拠点 どろっぷ」の運営をしています。「地域で子育て」というミッションに基づいて、地域交流活動も行っています。今回は、その一環として、神奈川県立港北高等学校で行われた「思港祭」でのブース出展「changeし隊 at 港北高校」を体験しました。"
    article "33"
    genre_id 1
    area_id 1
    group_id 1
    spice_id 1
    photo { fixture_file_upload("#{Rails.root}/spec/files/800x800.png", "image/png") }
  end
end
