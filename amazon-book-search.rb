#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'amazon/aws/search'
require 'amazon/aws'

include Amazon::AWS::Search # this is the way to avoid having to fully-qualify class names inline
include Amazon::AWS

# the amazon/aws/search new constructor signature is,  new(key_id=nil, associate=nil, locale=nil, cache=nil, user_agent=USER_AGENT) 
req = Request.new('AKIAJEJRITLFTFRSEK3A')
# puts "What does the request look like ? : " + req
is = ItemSearch.new( 'Books', { 'Title' => 'a tale for the time being' } )
# for every book...
obj = req.search(is)
puts("type of aws object returned by the search ? " + obj.inspect())
puts("number of items found: " + obj.length())
# -- comment req.search(is) do |book|
  # print book name and list of authors
  # -- comment -- puts %{"#{book.product_name}" by #{books.authors.join(',')}}
# -- comment -- end
