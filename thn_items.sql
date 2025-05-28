CREATE TABLE thn_items (
    item_id       NUMBER PRIMARY KEY,
    item_name     VARCHAR2(100) NOT NULL,
    category      VARCHAR2(50),
    unit_price    NUMBER(10,2) NOT NULL,
    stock_qty     NUMBER DEFAULT 0,
    reorder_level NUMBER DEFAULT 10
);
