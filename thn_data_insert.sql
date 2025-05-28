INSERT INTO thn_vendors (vendor_id, vendor_name, contact_email, contact_phone)
VALUES (seq_thn_vendor_id.NEXTVAL, 'Tech Supplies Co.', 'contact@techsupplies.com', '+95-9-111111111');

INSERT INTO thn_vendors (vendor_id, vendor_name, contact_email, contact_phone)
VALUES (seq_thn_vendor_id.NEXTVAL, 'OfficePro Myanmar', 'sales@officepro.com.mm', '+95-9-222222222');

INSERT INTO thn_items (item_id, item_name, category, unit_price, stock_qty, reorder_level)
VALUES (seq_thn_item_id.NEXTVAL, 'USB Keyboard', 'Computer Accessories', 7500, 20, 5);

INSERT INTO thn_items (item_id, item_name, category, unit_price, stock_qty, reorder_level)
VALUES (seq_thn_item_id.NEXTVAL, 'Wireless Mouse', 'Computer Accessories', 9800, 15, 5);

INSERT INTO thn_items (item_id, item_name, category, unit_price, stock_qty, reorder_level)
VALUES (seq_thn_item_id.NEXTVAL, 'A4 Paper Ream', 'Office Supplies', 5000, 50, 20);
