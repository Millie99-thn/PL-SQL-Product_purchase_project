-- Define a single PO item object
CREATE OR REPLACE TYPE obj_po_item AS OBJECT (
    item_id     NUMBER,
    quantity    NUMBER,
    unit_price  NUMBER
);
/

-- Define a table of PO items
CREATE OR REPLACE TYPE tbl_po_items AS TABLE OF obj_po_item;
/

-- Create Procedure
CREATE OR REPLACE PROCEDURE place_purchase_order (
    p_vendor_id   IN NUMBER,
    p_items       IN tbl_po_items
) IS
    v_po_id NUMBER;
BEGIN
    -- Generate new PO ID
    SELECT seq_thn_po_id.NEXTVAL INTO v_po_id FROM dual;

    -- Insert into thn_purchase_orders
    INSERT INTO thn_purchase_orders (po_id, vendor_id, po_date, status)
    VALUES (v_po_id, p_vendor_id, SYSDATE, 'PENDING');

    -- Loop through items and insert into thn_po_items
    FOR i IN 1 .. p_items.COUNT LOOP
        INSERT INTO thn_po_items (po_item_id, po_id, item_id, quantity, unit_price)
        VALUES (
            seq_thn_po_item_id.NEXTVAL,
            v_po_id,
            p_items(i).item_id,
            p_items(i).quantity,
            p_items(i).unit_price
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Purchase Order #' || v_po_id || ' placed successfully.');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error placing PO: ' || SQLERRM);
END;
/

-- Prepare PL/SQL Block to call the Procedure

DECLARE
    v_items tbl_po_items := tbl_po_items();
BEGIN
    -- Add first item: item_id = 1001 (USB Keyboard), qty = 10, price = 7500
    v_items.extend;
    v_items(1) := obj_po_item(1001, 10, 7500);

    -- Add second item: item_id = 1002 (Wireless Mouse), qty = 5, price = 9800
    v_items.extend;
    v_items(2) := obj_po_item(1002, 5, 9800);

    -- Call the procedure with vendor_id 201 (OfficePro Myanmar)
    place_purchase_order(201, v_items);
END;
/


SELECT * FROM thn_purchase_orders WHERE vendor_id = 201 ORDER BY po_id DESC;

SELECT * FROM thn_po_items WHERE po_id = 5001;

SELECT seq_thn_po_id.CURRVAL FROM dual;

SELECT seq_thn_po_item_id.CURRVAL FROM dual;

SELECT * FROM thn_vendors WHERE vendor_id = 201;

SELECT * FROM thn_items WHERE item_id IN (1001, 1002);

SELECT * FROM thn_vendors WHERE vendor_id = 201;
SELECT * FROM thn_items WHERE item_id IN (1001, 1002);
select * from thn_po_items;
SELECT * FROM thn_purchase_orders WHERE vendor_id = 201 ORDER BY po_id DESC;
SELECT * FROM thn_po_items WHERE po_id = 5004;

