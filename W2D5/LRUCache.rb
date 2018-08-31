class LRUCache
   def initialize(n)
     @size = n
     @cache = []
   end

   def count
     # returns number of elements currently in cache
     @cache.count
   end

   def add(el)
     # adds element to cache according to LRU principle
     return if @cache.include?(el) && @cache.last == el
     if @cache.include?(el)
        @cache.delete(el)
        @cache << el
     elsif @cache.length >= @size
       @cache.shift
       @cache << el
     else
       @cache << el
     end
   end

   def show
     # shows the items in the cache, with the LRU item first
     @cache
   end
   # helper methods go here!
end
