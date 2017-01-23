class Article < ApplicationRecord
  validates_length_of :title, :maximum => 150
  validates_length_of :body, :maximum => 1200
end
