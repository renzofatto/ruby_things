class Coin 
    attr_reader :type, :side 

    def initialize(type)
        @type = type
        @side = {
            heads: 0,
            tails: 0
        }
    end

    def is_heads(&block)
        @side[:heads]+=1
        print "#{type} coin toss resulted in "
        yield
    end

    def is_tails(&block)
        @side[:tails]+=1
        print "#{type} coin toss resulted in "
        yield
    end

    def print_stats
        puts "=============="
        puts "Printing stats"
        puts "- Heads: #{side[:heads]}"
        puts "- Tails: #{side[:tails]}"
        puts "=============="
        yield self if block_given?
    end
end


coin = Coin.new("Dime")

coin.print_stats

coin.is_heads{
    puts "heads"
}

1.upto(3) do
    coin.is_tails{
        puts "tails"
    }
end

coin.print_stats

coin.print_stats do |coin|
    puts "***********"
    puts "Printing stats when passing block"
    puts "#{coin.type}"
    puts "#{coin.side}"
    puts "***********"
end