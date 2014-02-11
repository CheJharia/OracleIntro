CREATE OR REPLACE
TRIGGER TRIGGER2 AFTER INSERT ON S_ITEM 
FOR EACH ROW 
BEGIN
  update s_ord set total = total + :new.price * :new.quantity where id = :new.ord_id;
END;
/

CREATE OR REPLACE
TRIGGER SG_S_ITEM_DELETE_FIX_TOTAL AFTER DELETE ON S_ITEM 
FOR EACH ROW 
BEGIN
  update s_ord set total = total - (:old.price * :old.quantity) where id = :old.ord_id;
END;
/

CREATE OR REPLACE
TRIGGER SG_S_ITEM_UPDATE_FIX_TOTAL AFTER UPDATE OF ORD_ID,ITEM_ID,PRODUCT_ID,QUANTITY_SHIPPED ON S_ITEM 
FOR EACH ROW 
BEGIN
  update s_ord set total = total - (:old.price * :old.quantity) + (:new.price * :new.quantity) where id = :new.ord_id;
END;
/