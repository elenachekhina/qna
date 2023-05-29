# frozen_string_literal: true

class AddAuthorToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :author, foreign_key: { to_table: :users }, null: false, default: 1
  end
end
