class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :request_uuid
      t.string :content
      t.string :request_ip

      t.timestamps
    end
  end
end
