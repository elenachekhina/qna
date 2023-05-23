class Link < ApplicationRecord
  belongs_to :linkable, polymorphic: true

  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :name, presence: true
  validates :url, presence: true

end
