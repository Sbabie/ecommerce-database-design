CREATE TABLE product_image (
  image_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  image_url VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE TABLE color (
  color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  hex_code VARCHAR(7)
);

CREATE TABLE product_category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT
);

CREATE TABLE brand (
  brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  country VARCHAR(100)
);

CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  brand_id INT,
  base_price DECIMAL(10, 2),
  category_id INT,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

CREATE TABLE size_category (
  size_category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE size_option (
  size_option_id INT AUTO_INCREMENT PRIMARY KEY,
  label VARCHAR(20),
  size_category_id INT,
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

CREATE TABLE product_item (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  size_option_id INT,
  color_id INT,
  stock_quantity INT,
  price_override DECIMAL(10, 2),
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id)
);

CREATE TABLE product_variation (
  variation_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  color_id INT,
  size_option_id INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

CREATE TABLE attribute_category (
  attribute_category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE attribute_type (
  attribute_type_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  data_type VARCHAR(50)
);

CREATE TABLE product_attribute (
  attribute_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  attribute_type_id INT,
  value VARCHAR(255),
  attribute_category_id INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);
