#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'amazon/aws/search/request'

req = Request.new('AKIAJUO56EUJUC6HDDRA')
puts "What does the request look like ? : " + req
is = ItemSearch.new( 'Books', { 'Title' => 'a tale for the time being' } )
# for every book...
req.search(is) do |book|
  # print book name and list of authors
  puts %{"#{book.product_name}" by #{books.authors.join(',')}}
end
