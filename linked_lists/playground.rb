require_relative 'noder'
require_relative 'recursive_linked_list'

list = RecursiveLinkedList.new

list << "Liz"
list << "Brett"
list << "Smooches"

list.add_after("Liz", "boobs")
list.all_data
puts list.separation("Liz", "Smooches")

