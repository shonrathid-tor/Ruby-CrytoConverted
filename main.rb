require './manager'

def menu
  manager = Manager.new
  loop do
    puts "Crypto Converter".center(50, "#")
    puts "a) Convert to USD"
    puts "b) Convert to EUR"
    puts "q) Quit"
    print "Action: "
    choice = gets.chomp


    case choice
    when 'a'
      coin_list = manager.coin_list
      puts "Available coins:"
      puts coin_list.join(", ").center(50, "$")
      print "Coin: "
      symbol = gets.chomp.upcase
      print "Amount: "
      amount = gets.chomp.to_i

      if coin_list.include? symbol
        result  = manager.calculate(amout,symbol,"USD")
        puts "#{amout} #{symbol}  - #{result} USD".center(50,"-")
        puts "-".center(50,"-")
        # Call conversion logic here
      else
        puts "#{symbol} is not available".center(50, "$")
      end
    end
    
   
   
    break unless choice !='q'
  end
end

menu()
