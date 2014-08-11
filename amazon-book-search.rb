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
nr_items = 0
page_nr = 0 
response = req.search(is, :ALL_PAGES) 
puts "The response object is an array of " + response.length.to_s + " " + response[0].class.to_s + " elements"
  # TODO - figure out how to get to each search response element item (i.e. a page at a time)
  response.each do |page|
    puts "NEXT PAGE >>>"
    printf( "Page %d had unique request ID %s.\n", page_nr += 1, page.item_search_response[0].operation_request[0].request_id )
    printf( "Page %d contained %d result(s).\n", page_nr, page.item_search_response[0].items[0].item.size ) 
    is_resp = page.item_search_response
    # Here's a quote from Ian McDonald, Everything we get back from AWS is transformed into an array.
    puts "The is_resp variable is of type " + is_resp.class.to_s + " (it contains " +is_resp.items.length.to_s + " element(s) of type " + is_resp.items.class.to_s  + ")"
    is_resp.items.each do |is|
      puts "NEXT is  >>>"
        is.item.each do |e|
          puts "NEXT e >>>"
          puts e.class.to_s
          puts "GET SOME DETAILS ABOUT THE ITEM FIELD >>> " 
          puts "PROPERTIES >>> "
          e.instance_variables.each do |iv|
            printf("instance variable name = %s\n", iv, e.instance_variable_get(iv) )
          end
        end
      end
    end
  
# 2. You don't have to access the items through a block.
  nr_items = 0
  response.each do |page|
    page.item_search_response[0].items.each do |item_set|
      nr_items += item_set.item.size
      printf( "The next item returned %d items.\n", item_set.item.size)
    end
  end
  printf( "Search returned %d items.\n", nr_items )
  # The first item in the list.
  items = response[0].item_search_response[0].items[0].item
  product1 = items[0]
  puts "\nProperties available for the first product returned:",
  product1.properties.sort
  puts
  
  # There are three ways to retrieve the property of a product:
  #
  # Instance variable:
  #
  p product1.asin
  p product1.item_attributes[0].title 
