CREATE TABLE [product_image] (
  [image_id] int PRIMARY KEY IDENTITY(1, 1),
  [product_id] int,
  [image_url] nvarchar(255)
)
GO

CREATE TABLE [color] (
  [color_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [hex_code] nvarchar(255)
)
GO

CREATE TABLE [product_category] (
  [category_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [description] nvarchar(255)
)
GO

CREATE TABLE [brand] (
  [brand_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [country] nvarchar(255)
)
GO

CREATE TABLE [product] (
  [product_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [brand_id] int,
  [base_price] decimal,
  [category_id] int
)
GO

CREATE TABLE [size_category] (
  [size_category_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255)
)
GO

CREATE TABLE [size_option] (
  [size_option_id] int PRIMARY KEY IDENTITY(1, 1),
  [label] nvarchar(255),
  [size_category_id] int
)
GO

CREATE TABLE [product_item] (
  [item_id] int PRIMARY KEY IDENTITY(1, 1),
  [product_id] int,
  [size_option_id] int,
  [color_id] int,
  [stock_quantity] int,
  [price_override] decimal
)
GO

CREATE TABLE [product_variation] (
  [variation_id] int PRIMARY KEY IDENTITY(1, 1),
  [product_id] int,
  [color_id] int,
  [size_option_id] int
)
GO

CREATE TABLE [attribute_category] (
  [attribute_category_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255)
)
GO

CREATE TABLE [attribute_type] (
  [attribute_type_id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(255),
  [data_type] nvarchar(255)
)
GO

CREATE TABLE [product_attribute] (
  [attribute_id] int PRIMARY KEY IDENTITY(1, 1),
  [product_id] int,
  [attribute_type_id] int,
  [value] nvarchar(255),
  [attribute_category_id] int
)
GO

ALTER TABLE [product_image] ADD FOREIGN KEY ([product_id]) REFERENCES [product] ([product_id])
GO

ALTER TABLE [product] ADD FOREIGN KEY ([brand_id]) REFERENCES [brand] ([brand_id])
GO

ALTER TABLE [product] ADD FOREIGN KEY ([category_id]) REFERENCES [product_category] ([category_id])
GO

ALTER TABLE [size_option] ADD FOREIGN KEY ([size_category_id]) REFERENCES [size_category] ([size_category_id])
GO

ALTER TABLE [product_item] ADD FOREIGN KEY ([product_id]) REFERENCES [product] ([product_id])
GO

ALTER TABLE [product_item] ADD FOREIGN KEY ([size_option_id]) REFERENCES [size_option] ([size_option_id])
GO

ALTER TABLE [product_item] ADD FOREIGN KEY ([color_id]) REFERENCES [color] ([color_id])
GO

ALTER TABLE [product_variation] ADD FOREIGN KEY ([product_id]) REFERENCES [product] ([product_id])
GO

ALTER TABLE [product_variation] ADD FOREIGN KEY ([color_id]) REFERENCES [color] ([color_id])
GO

ALTER TABLE [product_variation] ADD FOREIGN KEY ([size_option_id]) REFERENCES [size_option] ([size_option_id])
GO

ALTER TABLE [product_attribute] ADD FOREIGN KEY ([product_id]) REFERENCES [product] ([product_id])
GO

ALTER TABLE [product_attribute] ADD FOREIGN KEY ([attribute_type_id]) REFERENCES [attribute_type] ([attribute_type_id])
GO

ALTER TABLE [product_attribute] ADD FOREIGN KEY ([attribute_category_id]) REFERENCES [attribute_category] ([attribute_category_id])
GO
