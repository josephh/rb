#!/usr/bin/ruby -w
# amazon-book-search.rb
require 'amazon/aws/search'
require 'amazon/aws'

include Amazon::AWS::Search # this is the way to avoid having to fully-qualify class names inline
include Amazon::AWS

# the amazon/aws/search new constructor signature is,  new(key_id=nil, associate=nil, locale=nil, cache=nil, user_agent=USER_AGENT) 
# The request class, search() method  works with an ItemSearch object
req = Request.new('AKIAJEJRITLFTFRSEK3A')
# New up the ItemSearch, passing a search index (Books) and a hash of search parameters and values 
is = ItemSearch.new( 'Books', { 'Title' => 'a tale for the time being' } )
# ResponseGroup objects "...determine which data pertaining to the item(s) being sought is returned..." they help make querying more efficient by limiting the amount of data returned (so should be used wherever possible)
rg = ResponseGroup.new( 'Small') 

nr_items = 0
page_nr = 0 

# assign the response group attribute on the ItemSearch object...
is.response_group = rg
#... before passing the ItemSearch obj into the search method (including the 'symbol' :ALL_PAGES) and the block to go with it

# There are different ways to use the aws object returned from the search
# 1. Pass the result into a block
response = req.search(is, :ALL_PAGES) 
  # TODO - figure out how to get to each search response element item (i.e. a page at a time)
  response[0].item_search_response[0].items.each do |item|
    puts "NEXT ITEM : " + item.to_s
  end 
# req.search(is, :ALL_PAGES) do |page| 
#  puts ("NEXT PAGE : ") + page.inspect
#  page.items do |item|
#    puts "ITEM :" + item.inspect
#    item_set.item.each do |iv|
#      printf("%s = %s\n", iv, item.instance_variable_get(iv))
#     end
#  end
# end

