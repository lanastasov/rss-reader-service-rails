class CreateRssurls < ActiveRecord::Migration[6.1]
  def change
    create_table :rssurls do |t|
      t.string :url

      t.timestamps
    end
  end
end
