class Spiciness < ActiveYaml::Base
  set_root_path Rails.root.join('db/fixtures')
  set_filename 'spiciness'

  include ActiveHash::Associations
  has_many :articles
end
