class CreateWebhook < ActiveRecord::Migration[8.0]
  def change
    create_table :webhooks do |t|
      t.string :transaction_id, null: false
      t.string :context
      t.string :action
      t.jsonb :params
      t.string :error

      t.timestamps
    end
  end
end
