CREATE TABLE thn_po_items (
    po_item_id   NUMBER PRIMARY KEY,
    po_id        NUMBER,
    item_id      NUMBER,
    quantity     NUMBER NOT NULL,
    unit_price   NUMBER(10,2) NOT NULL,
    total_price  NUMBER(10,2) GENERATED ALWAYS AS (quantity * unit_price) VIRTUAL,

    CONSTRAINT fk_poi_po FOREIGN KEY (po_id) REFERENCES thn_purchase_orders(po_id),
    CONSTRAINT fk_poi_item FOREIGN KEY (item_id) REFERENCES thn_items(item_id)
);
