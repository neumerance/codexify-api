class Verse < ApplicationRecord
  validates :translation_code,
            :book_name,
            :chapter_id,
            :verse_id,
            :content,
            :title,
            presence: true
end
