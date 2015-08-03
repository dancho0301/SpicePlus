# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'haml'

[Genre, Line, Area, Group, Spice, ArticlePlan, ArticleSchedule, ArticleRecommend, User].each do |c|
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  c.destroy_all
  list[c.to_s.tableize.to_sym].each do |r|
    c.create do |t|
      r.each do |i, v|
        t.send "#{i}=", v
      end
    end
  end
end

# 記事だけは画像があるので外出し
[Article, Report].each do |c|
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  c.destroy_all
  list[c.to_s.tableize.to_sym].each do |r|
    c.create do |t|
      r.each do |i, v|
        if i == "photo"
          t.photo = File.new("#{Rails.root}/db/data/#{v}")
        elsif i == "article" and c.to_s == "Article"
          File.open("#{Rails.root}/db/seeds/articles/#{v}") do |f|
            t.article = Haml::Engine.new(f.read,:format => :xhtml).render(Object.new)
          end
        else
          t.send "#{i}=", v
        end
      end
    end
  end
end

[ArticleImage].each do |c|
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml).symbolize_keys
  c.destroy_all
  list[c.to_s.tableize.to_sym].each do |r|
    c.create do |t|
      r.each do |i, v|
        if i == "image"
          t.image = File.new("#{Rails.root}/db/data/#{v}")
        else
          t.send "#{i}=", v
        end
      end
    end
  end
end
