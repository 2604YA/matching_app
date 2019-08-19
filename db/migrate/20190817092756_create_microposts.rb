class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    #そのユーザーの投稿を作成時刻と紐づけて列挙する際に役立つ
    add_index :microposts, [:user_id, :created_at]
  end
end
