FactoryBot.define do
  factory :verse do
    translation_code { 'MBBR' }
    book_name { 'Genesis' }
    chapter_id { 1 }
    verse_id { 1 }
    content { 'scripture...' }
  end
end
