class Fallacy < ActiveRecord::Base
  extend FriendlyId; friendly_id :slug
  translates :name, :description, fallbacks_for_empty_translations: true
  default_scope { includes(:translations) }
  has_many :statements, inverse_of: :fallacy

  def cache_key
    "#{super}-#{Globalize.locale}"
  end
end
