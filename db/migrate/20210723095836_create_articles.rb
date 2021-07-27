class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|   
      t.references  :user            , null: false
      t.string      :product_name    , null: false
      t.text        :description     , null: false
      t.integer     :category_id     , null: false
      t.integer     :status_id       , null: false
      t.integer     :burden_id       , null: false
      t.integer     :delivery_id     , null: false
      t.integer     :days_delivery_id, null: false
      t.integer     :price           , null: false
      t.integer     :genre_id        , null: false
      t.timestamps
    end
  end
end
