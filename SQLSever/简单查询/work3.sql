--1.查询“S001”号供应商的供应信息（结果含供应商名、项目名、零件名、供应量）；
select SNAME,JNAME,PNAME,QTY
FROM SPJ168,S168,P168,J168
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO AND SPJ168.SNO='S001'

--2.查询“北京”的供应商的供应信息（结果含供应商名、项目名、零件名、供应量）；
SELECT SNAME,JNAME,PNAME,QTY
FROM SPJ168,S168,P168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO AND S168.CITY='北京'

--3.查询颜色为“红”色的零件供应信息（结果含供应商名、项目名、零件名、供应量）；
SELECT SNAME,JNAME,PNAME,QTY
FROM SPJ168,S168,P168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO AND P168.COLOR='红'

--4.查询供应工程“长春一汽”零件的供应商信息；
SELECT S168.*
FROM SPJ168,S168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.JNO=J168.JNO AND J168.JNAME='长春一汽'


--5.查询供应工程“长春一汽”零件“螺母”的供应商信息；
SELECT S168.*
FROM SPJ168,S168,J168,P168
WHERE SPJ168.SNO=S168.SNO AND SPJ168.JNO=J168.JNO AND J168.JNAME='长春一汽' AND SPJ168.PNO=P168.PNO AND P168.PNAME='螺  母'

--6.查询“螺丝刀”零件的供应信息（结果含供应商名、项目号、零件号、供应量）；
SELECT SNAME,J168.JNO,P168.PNO,QTY
FROM SPJ168,S168,P168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO AND P168.PNAME='螺丝刀'

--7.查询“北京启明星”供应商的供应信息（结果含供应商名、项目号、零件号、供应量）；
SELECT SNAME,J168.JNO,P168.PNO,QTY
FROM SPJ168,S168,P168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO AND S168.SNAME='北京启明星'

--8.查询供应量在200和400之间的供应信息（结果含供应商名、项目名、零件名、供应量）；
SELECT SNAME,JNAME,PNAME,QTY
FROM SPJ168,S168,P168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO AND QTY BETWEEN 200 AND 400
ORDER BY SNAME ASC


--9.查询两个供应量最大的供应信息（结果含供应商名、项目名、零件名、供应量）；
SELECT TOP 2 SNAME,JNAME,PNAME,QTY
FROM SPJ168,S168,P168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.PNO=P168.PNO AND SPJ168.JNO=J168.JNO
ORDER BY QTY DESC

--10.查询使用“天津”供应商供应的零件的工程信息；
SELECT J168.*
FROM SPJ168,S168,J168 
WHERE SPJ168.SNO=S168.SNO AND SPJ168.JNO=J168.JNO AND S168.CITY='天津'

--11.查询工程“长春一汽”使用的零件的供应商信息。
SELECT DISTINCT S168.*
FROM SPJ168 SPJX,SPJ168 SPJY,SPJ168 SPJZ,S168,J168 
WHERE SPJX.SNO=SPJY.SNO AND SPJX.JNO=SPJZ.JNO AND SPJY.JNO=J168.JNO AND SPJZ.SNO=S168.SNO AND J168.JNAME LIKE '长春一汽'