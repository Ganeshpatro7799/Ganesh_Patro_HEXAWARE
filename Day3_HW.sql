--1.write query to display mem id,mem name,city and membership status
--who having life time membership.hint :life time mem is "permanent"

 select * from LMS_BOOK_DETAILS;
  select * from LMS_BOOK_ISSUE;
 select * from LMS_FINE_DETAILS;
  select * from LMS_MEMBERS;
 select * from LMS_SUPPLIERS_DETAILS;

 SELECT MEMBER_ID,MEMBER_NAME,CITY,MEMBERSHIP_STATUS FROM LMS_MEMBERS
 WHERE MEMBERSHIP_STATUS='permanent';

 --3.QUERY TO DISPLAY MEM ID,MEM NAME WHO HAVE BOOK CODE 'BL000002'

 SELECT MEMBER_ID,MEMBER_NAME FROM LMS_MEMBERS
 WHERE MEMBER_ID in (SELECT MEMBER_ID FROM LMS_BOOK_ISSUE WHERE BOOK_CODE='BL000002');

 --4.DISPLAY BOOK CODE,BOOK TITLE ,AUTHOR OF BOOKS WHOSE AUTHOR NAME BEGINS WITH 'P'

 SELECT BOOK_CODE,BOOK_TITLE,AUTHOR FROM LMS_BOOK_DETAILS WHERE AUTHOR LIKE 'P%';

 --5.DISPLAY TOTAL NO OF JAVA BOOKS AVAILABLE IN LIBRARY WITH ALIAS NAME 'NO_OF_BOOKS'

  SELECT COUNT(BOOK_CODE) AS 'NO_OF_BOOKS'
  FROM LMS_BOOK_DETAILS 
  WHERE CATEGORY='JAVA'
 --6.DISPLAY CATEGORY,NO OF BOOKS IN EACH CATEGORY WITH ALIAS NAME 'NO_OF_BOOKS'
 SELECT CATEGORY,COUNT(BOOK_CODE) AS 'NO_OF_BOOKS'
 FROM LMS_BOOK_DETAILS
 GROUP BY CATEGORY;

 --7.DISPLAY NO OF BOOKS PUBLISHED BY  "PRENTICE HALL" WITH ALIAS NAME 'NO_OF_BOOKS'
 SELECT COUNT(BOOK_CODE) AS 'NO_OF_BOOKS'
 FROM LMS_BOOK_DETAILS
 WHERE PUBLICATION='Prentice Hall';
 ---- AND
 SELECT COUNT(BOOK_TITLE) AS 'NO_OF_BOOKS'
 FROM LMS_BOOK_DETAILS
 GROUP BY PUBLICATION
 HAVING PUBLICATION = 'Prentice Hall'

 --8.display book code,book title of books which are issued on date 1st april 2012

 select BOOK_CODE,BOOK_TITLE 
 FROM LMS_BOOK_DETAILS 
 WHERE BOOK_CODE IN (SELECT BOOK_CODE FROM LMS_BOOK_ISSUE WHERE DATE_ISSUE ='2012-04-01');

 --9.DISPLAY MEMBER ID,MEM NAME,DATE REGISTER ,EXPIRE DATE OF MEM WHO REG BEFORE APR 2013 
 SELECT * FROM LMS_MEMBERS

 SELECT MEMBER_ID,MEMBER_NAME,DATE_REGISTER,DATE_EXPIRE 
 FROM LMS_MEMBERS
 WHERE DATE_REGISTER<'2013-04-01';

 --10. DISPLAY MEM ID,MEM NAME,DATE REG,MEM STATUS WHO REG BEFORE MARCH 2012 AND MEM STATUS= TEMP.
 SELECT * FROM LMS_MEMBERS

 SELECT MEMBER_ID,MEMBER_NAME,DATE_REGISTER,MEMBERSHIP_STATUS
 FROM LMS_MEMBERS
 WHERE DATE_REGISTER<='2012-02-29' AND MEMBERSHIP_STATUS='Temporary';

 --11.DISPLAY MEM_ID,MEM NAME WHO BELONGS TO CITY EITHER CHENNAI OR DELHI
  SELECT MEMBER_ID,MEMBER_NAME AS 'NAME'
 FROM LMS_MEMBERS
 WHERE CITY='CHENNAI' OR CITY='DELHI';
 --12.query to concat book title,author
 --in following format
 --ex:'c_is written by yashwant kanetakar'
 -- alias 'book-written_by'
 SELECT *  FROM LMS_BOOK_DETAILS

 select CONCAT(BOOK_TITLE,'_is written by ',AUTHOR) AS 'BOOK_WRIITEN_BY'
 FROM LMS_BOOK_DETAILS
 
--13.DISPLAY AVG PRICE OF BOOKS BELONGS TO 'JAVA' CATEGORY WITH ALIAS NAME 'AVGPRICE'

 SELECT AVG(PRICE) AS 'AVGPRICE'
 FROM LMS_BOOK_DETAILS
 WHERE CATEGORY='JAVA';

 --14.DISPLAY SUPP_ID,SUPP_NAME AND EMAIL OF SUPPLIES WHO HAVING GMAIL ACCOUNT
 SELECT *  FROM LMS_SUPPLIERS_DETAILS
 
 SELECT SUPPLIER_ID,SUPPLIER_NAME,EMAIL
 FROM LMS_SUPPLIERS_DETAILS
 WHERE EMAIL like '%gmail.com';

 --16.DISPLAY SUPP ID,SUPP NAME,CONTACT.IF PH NO IS NULL THEN DISPLAY NO ELSE YES WITH ALIAS NAME "PHONENUM AVAILABLE"
-- HINT:USE ISNULL.
 select * from LMS_SUPPLIERS_DETAILS;

SELECT SUPPLIER_ID,SUPPLIER_NAME,CONTACT ,

 CASE
    WHEN  CONTACT  IS NULL THEN 'NO' 
	ELSE 'YES' 
 END AS 'PHONENUM AVAILABLE'
 FROM LMS_SUPPLIERS_DETAILS ;
