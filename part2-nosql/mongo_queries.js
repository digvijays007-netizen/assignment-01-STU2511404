{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 // OP1: insertMany() \'97 insert all 3 documents\
db.products.insertMany([\
  \{\
    product_id: "E1",\
    name: "Smartphone X",\
    category: "Electronics",\
    price: 45000,\
    brand: "TechBrand",\
    specifications: \{\
      warranty_years: 2,\
      voltage: "220V",\
      battery: "5000mAh"\
    \},\
    features: ["5G", "OLED Display", "Fast Charging"]\
  \},\
  \{\
    product_id: "C1",\
    name: "Men's Jacket",\
    category: "Clothing",\
    price: 3500,\
    brand: "FashionHub",\
    sizes: ["S", "M", "L", "XL"],\
    material: "Leather",\
    colors: ["Black", "Brown"]\
  \},\
  \{\
    product_id: "G1",\
    name: "Organic Milk",\
    category: "Groceries",\
    price: 120,\
    brand: "FarmFresh",\
    expiry_date: new Date("2024-12-20"),\
    nutritional_info: \{\
      calories: 150,\
      protein: "8g",\
      fat: "5g"\
    \}\
  \}\
]);\
\
// OP2: find() \'97 retrieve all Electronics products with price > 20000\
db.products.find(\{\
  category: "Electronics",\
  price: \{ $gt: 20000 \}\
\});\
\
// OP3: find() \'97 retrieve all Groceries expiring before 2025-01-01\
db.products.find(\{\
  category: "Groceries",\
  expiry_date: \{ $lt: new Date("2025-01-01") \}\
\});\
\
// OP4: updateOne() \'97 add a "discount_percent" field to a specific product\
db.products.updateOne(\
  \{ product_id: "E1" \},\
  \{ $set: \{ discount_percent: 10 \} \}\
);\
\
// OP5: createIndex() \'97 create an index on category field\
db.products.createIndex(\{ category: 1 \});\
\
// Explanation:\
// Creating an index on the "category" field improves query performance,\
// especially for queries that filter products by category (like OP2 and OP3).}