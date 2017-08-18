class MyHash < Hash
  attr_accessor :my_hash

  def initialize(hash)
    @my_hash = hash
  end

  def dig(*args)
    raise ArgumentError if args.length == 0
    temp_hash = @my_hash

    args.each do |key|
      if temp_hash.key?(key)
        temp_hash = temp_hash[key]
      else
        return nil
      end
    end

    return temp_hash
  end
end