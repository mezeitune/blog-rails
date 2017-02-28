class RanameArtileToArticle < ActiveRecord::Migration[5.0]
  def change
  	rename_column :has_categories , :artile_id, :article_id
  end
end
