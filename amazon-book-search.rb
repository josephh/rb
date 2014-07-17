#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'amazon/aws/search'
require 'amazon/aws'

include Amazon::AWS::Search # this is the way to avoid having to fully-qualify class names inline
include Amazon::AWS

# the amazon/aws/search new constructor signature is,  new(key_id=nil, associate=nil, locale=nil, cache=nil, user_agent=USER_AGENT) 
req = Request.new('AKIAJEJRITLFTFRSEK3A')
puts "What does the request object look like ? : " + req.inspect()
is = ItemSearch.new( 'Books', { 'Title' => 'a tale for the time being' } )
# for every book...
awsObj = req.search(is)
arr = awsObj.properties()
arr.each{|prop| puts "next prop " + prop}
# puts("type of aws object returned by the search ? " + obj.inspect())

  # print book name and list of authors
  # -- comment -- puts %{"#{book.product_name}" by #{books.authors.join(',')}}
# -- comment -- end
