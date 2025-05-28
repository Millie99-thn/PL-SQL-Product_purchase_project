CREATE TABLE thn_purchase_orders (
    po_id         NUMBER PRIMARY KEY,
    vendor_id     NUMBER,
    po_date       DATE DEFAULT SYSDATE,
    status        VARCHAR2(20) DEFAULT 'PENDING',
    CONSTRAINT fk_po_vendor FOREIGN KEY (vendor_id) REFERENCES thn_vendors(vendor_id)
);
