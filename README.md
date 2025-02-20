# Stock Simulator

## Description
Stock Simulator is a simple command-line application written in Ruby to manage a small inventory of products. It allows users to add new products, update existing stock, check product details, and persist data using file storage.

## Features
- Add new products with quantity and price.
- Update the quantity of existing products.
- Check product details (name, quantity, and price).
- Save and load stock data from a file.
- Handle invalid inputs to prevent errors.

## Installation
### Prerequisites
- Ruby (latest stable version recommended)

### Clone the Repository
```sh
git clone https://github.com/DragonKzWy/StockSimulator.git
cd StockSimulator
```

## Usage
Run the application using:
```sh
ruby StockSimulator.rb
```

### Options
1. **Add Product**: Enter the product name, quantity, and price.
2. **Check Product**: View details of a specific product.
3. **Exit**: Close the application.

## File Storage
Stock data is stored in a file named `stock.txt` using Ruby's `Marshal` for serialization, allowing data persistence between sessions.

## Error Handling
- Ensures quantity and price inputs are positive numbers.
- Prevents invalid operations such as removing more quantity than available.
- Handles missing product lookups gracefully.

## Contributing
Feel free to fork the repository and submit pull requests with improvements or bug fixes.

## License
This project is licensed under the MIT License.

## Author
Wesley Santos (https://github.com/DragonKzWy)

