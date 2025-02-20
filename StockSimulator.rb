# Stock Simulator

# Method to read stock data from a file
def read_stock
  if File.exist?("stock.txt")
    file = File.read("stock.txt")
    stock = Marshal.load(file) # Using Marshal to serialize data
  else
    stock = {}
  end
  stock
end

# Method to save stock data to a file
def save_stock(stock)
  File.open("stock.txt", "w") do |file|
    file.write(Marshal.dump(stock)) # Serializing data for saving
  end
end

# Add a new product or update quantity
def add_product(stock, name, quantity, price)
  if stock.has_key?(name)
    stock[name][:quantity] += quantity
  else
    stock[name] = { quantity: quantity, price: price }
  end
end

# Remove a product or decrease quantity
def remove_product(stock, name, quantity)
  if stock.has_key?(name) && stock[name][:quantity] >= quantity
    stock[name][:quantity] -= quantity
    stock.delete(name) if stock[name][:quantity] == 0
  else
    puts "Product not found or insufficient quantity!"
  end
end

# Check product details
def check_product(stock, name)
  if stock.has_key?(name)
    puts "Product: #{name}, Quantity: #{stock[name][:quantity]}, Price: #{stock[name][:price]}"
  else
    puts "Product not found!"
  end
end

# Get product details from user
def get_product_input
  print "Enter product name: "
  name = gets.chomp.strip
  
  print "Enter quantity: "
  quantity = gets.chomp.to_i
  if quantity <= 0
    puts "Invalid quantity. Please enter a positive number."
    return nil
  end

  print "Enter price: "
  price = gets.chomp.to_f
  if price <= 0
    puts "Invalid price. Please enter a positive number."
    return nil
  end

  { name: name, quantity: quantity, price: price }
end

# Example execution
stock = read_stock
loop do
  puts "\n1. Add Product\n2. Check Product\n3. Exit"
  print "Choose an option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    product = get_product_input
    if product
      add_product(stock, product[:name], product[:quantity], product[:price])
      save_stock(stock)
      puts "Product added successfully!"
    end
  when 2
    print "Enter product name to check: "
    name = gets.chomp.strip
    check_product(stock, name)
  when 3
    puts "Exiting program."
    break
  else
    puts "Invalid option, please try again."
  end
end
