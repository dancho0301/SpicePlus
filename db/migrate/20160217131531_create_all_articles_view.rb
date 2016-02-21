class CreateAllArticlesView < ActiveRecord::Migration
  DB_NAME = "all_articles"   # VIEWの名称

  def up
    execute create_view_sql
  end

  def down
    execute drop_view_sql
  end

  def create_view_sql
    db_adapter = ActiveRecord::Base.connection_config[:adapter]

    case db_adapter
    when 'mysql2' then
      create_mysql_view_sql
    else
      raise Exception, "Not Support Data Base [#{db_adapter}]"
    end
  end

  def drop_view_sql
    "DROP VIEW #{DB_NAME}"
  end

  def create_mysql_view_sql
    "
      create or replace view #{DB_NAME}
      as
        select
          genre_id,
          id,
          title,
          publication_date,
          description,
          article,
          photo_file_name,
          photo_content_type,
          photo_file_size,
          photo_updated_at,
          publication,
          spice_id
        from articles
        union all
        select
          0 as genre_id,
          id,
          title,
          publication_date,
          description,
          article,
          photo_file_name,
          photo_content_type,
          photo_file_size,
          photo_updated_at,
          publication,
          null as spice_id
        from other_articles
      ;
    "
  end
end
