  class LRUCache
    def initialize(size)
        @size = size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @cache.include?(el)
        @cache.delete(el)
        @cache << el
      elsif count >= @size
        @cache.shift
        @cache << el
      else
        @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      p @cache
    end

    

  end

  p johnny_cache = LRUCache.new(4)
  p johnny_cache.add("I walk the line")
  p johnny_cache.add(5)
  p johnny_cache.count
  p johnny_cache.add([1,2,3])
  p johnny_cache.add(5)
  p johnny_cache.add(-5)
  p johnny_cache.add({a: 1, b: 2, c: 3})
  p  johnny_cache.add([1,2,3,4])
  p johnny_cache.add("I walk the line")
  p johnny_cache.add(:ring_of_fire)
  p johnny_cache.add("I walk the line")
  p johnny_cache.add({a: 1, b: 2, c: 3})
  p johnny_cache.show