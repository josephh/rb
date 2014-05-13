#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'aws/s3'

if ARGV.size !=3
  puts "Usage: #{$0} [Amazon Web Services AccessKey ID] [secret Amazon key] [text to search for]"
  exit
end
access_key, secret_key, search_request = ARGV
conn = AWS::S3::Base.establish_connection!(
    :access_key_id     => access_key,
    :secret_access_key => secret_key)
# for every book...
conn.keyword_search(search_request, 'books', Amazon::Search::LIGHT) do |book|
  # print book name and list of authors
  puts %{"#{book.product_name}" by #{books.authors.join(',')}}
end
