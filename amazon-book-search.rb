#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'amazon/aws'

if ARGV.size !=3
  puts "Usage: #{$0} [Amazon Web Services AccessKey ID] [secret Amazon key] [text to search for]"
  exit
end
access_key, secret_key, search_request = ARGV
req = Amazon::AWS::Search:Request.new( :key_id => access_key)
puts "What does the request look like ? : " + req
is = Amazon::AWS::ItemSearch.new( 'Books', { 'Title' => 'a tale for the time being' } )
# for every book...
req.search(is) do |book|
  # print book name and list of authors
  puts %{"#{book.product_name}" by #{books.authors.join(',')}}
end
