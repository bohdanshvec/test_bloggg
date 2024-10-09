# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_220_108_091_519) do
  create_table 'questions', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
