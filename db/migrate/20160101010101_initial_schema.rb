require_relative '../extended_migration'

class InitialSchema < ActiveRecord::Migration
  include ExtendedMigration

  def change

    create_table :users do |t|
      t.string  :name,           default: ''
      t.string  :locale,         limit: 10
      t.boolean :guest,          default: false
      t.integer :sessions_count, default: 0
    end

    create_table :sessions do |t|
      t.string     :token, limit: 32, index: { unique: true }
      t.references :user
    end

    create_table :friendly_id_slugs do |t|
      t.references :sluggable, polymorphic: true, index: false
      t.string     :slug
      t.string     :scope, null: true

      t.index %i(slug sluggable_type scope), unique: true
      t.index %i(slug sluggable_type)
      t.index %i(sluggable_type)
      t.index %i(sluggable_id)
    end

    create_table :fallacies do |t|
      t.string :slug, index: { unique: true }
    end

    create_table :fallacy_translations do |t|
      t.references :fallacy
      t.string     :locale, limit: 10, index: true
      t.string     :name
      t.text       :description, :example, null: false
    end

  end
end
