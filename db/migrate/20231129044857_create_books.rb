class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid  do |t|
      t.timestamps null: false, default: -> { 'NOW()' }, index: true

      t.string :context, null: false
      t.vector :embedding, dimensions: 1536, using: :ivfflat, opclass: :vector_ip_ops
    end
  end
end
