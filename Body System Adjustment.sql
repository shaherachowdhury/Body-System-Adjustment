USE HAP464

select top 10 a.*,lr from dbo.cleandata a left join dbo.adjustedLR b on a.icd9=b.icd9

select a.*, iif(isnumeric(LR)=1, convert(float,LR),1.0) as LR
, left (a.icd9,4) as body
,IIF (AgeAtDeath is null, 0,1) as actual 
into #data from dbo.cleandata a left join dbo.adjustedLR b on a.icd9=b.icd9


---run icd codes
select *
,iif(body in('I001','I002','I003','I004','I005','I006','I007','I008','I009','I010','I011',
'I012','I013','I014','I015','I016','I017','I018','I019','I020','I021','I022','I023','I024',
'I025','I026','I027','I028','I029','I030','I031','I032','I033','I034','I035','I036','I037',
'I038','I039','I040','I041','I042','I043','I044','I045','I046','I047','I048','I049','I050',
'I051','I052','I053','I054','I055','I056','I057','I058','I059','I060','I061','I062','I063','I064',
'I065','I066','I067','I068','I069','I070','I071','I072','I073','I074','I075','I076','I077','I078','I079','I080',
'I081','I082','I083','I084','I085','I086','I087','I088','I089','I090','I091','I092','I093','I094','I095','I096',
'I097','I098','I099','I100','I101','I102','I103','I104','I105','I106','I107','I108','I109','I110','I111','I112','I113','I114',
'I115','I116','I117','I118','I119','I120','I121','I122','I123','I124','I125','I126','I127','I128','I129','I130','I131','I132',
'I133','I134','I135','I136','I137','I138','I139'),LR,1) as Infectious

---
,iif(body in('I140','I141','I142','I143','I144','I145','I146','I147','I148','I149','I150','I151','I152','I153','I154','I155','I156',
'I157','I158','I159','I160','I161','I162','I163','I164','I165','I166','I167','I168','I169','I170','I171','I172','I173','I174','I175',
'I176','I177','I178','I179','I180','I181','I182','I183','I184','I185','I186','I187','I188','I189','I190','I191','I192','I193','I194','I195',
'I196','I197','I198','I199','I200','I201','I202','I204','I205','I206','I207','I208','I209','I210','I211','I212','I213','I214','I215','I216','I217',
'I218','I219','I220','I221','I222','I223','I224','I225','I226','I227','I228','I229','I230','I231','I232','I233','I234','I235','I236','I237','I238',
'I239'),LR,1) as Neoplasms

---
,iif(body in('I240','I241','I242','I243','I244','I245','I246','I247','I248','I249','I250','I251','I252','I253','I254','I255','I256','I257',
'I258','I259','I260','I261','I262','I263','I264','I265','I266','I267','I268','I269','I270','I271','I272','I273','I274','I275','I276','I277',
'I278','I279'),LR,1) as Endrocline

---
,iif(body in('I280', 'I281','I282','I283','I284','I285','I286','I287','I288','I289'), LR,1) as Blood

--
,iif(body in('I290','I291','I292','I293','I294','I295','I296','I297','I298','I299','I300','I301','I302','I303','I304','I305','I306','I307',
'I308','I309','I310','I311','I312','I313','I314','I315','I316','I317','I318','I319'),LR,1) as MentalDisorders


---
,iif(body in('I320','I321','I322','I323','I324','I325','I326','I327','I328','I329','I330','I331','I339','I339','I339','I339','I339','I339','I339',
'I339','I340','I341','I342','I343','I344','I345','I346','I347','I348','I349','I350','I351','I352','I353','I354','I355','I356','I357','I358','I359',
'I360','I361','I362','I363','I364','I365','I366','I367','I368','I369','I370','I371','I372','I373','I374','I375','I376','I377','I378','I379','I380',
'I381','I382','I383','I384','I385','I386','I387','I388','I389'),LR,1) as NervousSystem


---
,iif(body in('I390','I391','I392','I393','I394','I395','I396','I397','I398','I399','I400','I401','I402','I403','I404','I405','I406','I407','I408',
'I409','I410','I411','I412','I413','I414','I415','I416','I417','I418','I419','I420','I421','I422','I423','I424','I425','I426','I427','I428','I429',
'I430','I431','I432','I433','I434','I435','I436','I437','I438','I439','I440','I441','I442','I443','I444','I445','I446','I447','I448','I449','I450',
'I451','I452','I453','I454','I455','I456','I457','I458','I459'),LR,1) as Circulatory


---
,iif(body in('I460','I461','I462','I463','I464','I465','I466','I467','I468','I469','I470','I471','I472','I473','I474','I475','I476','I477',
'I478','I479','I480','I481','I482','I483','I484','I485','I486','I487','I488','I489','I490','I491','I492','I493','I494','I495','I496','I497',
'I498','I499','I500','I501','I502','I503','I504','I505','I506','I507','I508','I509','I510','I511','I512','I513','I514','I515','I516','I517',
'I518','I519'),LR,1) as Respiratory

---
,iif(body in('I520','I521','I522','I523','I524','I525','I526','I527','I528','I529','I530','I531','I532','I533','I534','I535','I536','I537','I538',
'I539','I540','I541','I542','I543','I544','I545','I546','I547','I548','I549','I550','I551','I552','I553','I554','I555','I556','I557','I558','I559',
'I560','I561','I562','I563','I564','I565','I566','I567','I568','I569','I570','I571','I572','I573','I574','I575','I576',
'I577','I578','I579'),LR,1) as Digestive


---

,iif(body like '%V%',LR,1) as Vcodes
, iif(body like '%v%', LR, 1) as Ecodes 
into #systems
from #data

---
select id, actual 
, max(Infectious) * max(Neoplasms) * max(Endrocline) *max(Blood) *max(MentalDisorders) * max(NervousSystem) 
*max(Circulatory) *max(Respiratory) *max(Digestive) *max(Vcodes) *max(Ecodes)
as score into #systems2 from #systems group by id, actual 

---
select id, sum(iif (score is null, 0., score))as predicted, max (actual) as actual
into #systems3 from #systems2
group by id
order by actual desc

---
create table #cutoff(cutoff float);
insert into #cutoff (cutoff)
values (0.0), (0.25), (0.4), (0.7), (0.85), (1.0);

select ROW_NUMBER () over(order by predicted) Row
, [predicted] as [prob], Actual 
into OrderedData from #systems3 order by [predicted] 

---
select cutoff 
,iif (a.predicted > b.cutoff, 1.,0.) as predicted 
, actual into #systems1
from #systems3 a cross join #cutoff b 

---
select cutoff
, sum (cast(actual as float) * cast(predicted as float)) / sum(cast(actual as float)) as sensivity,
sum ((1-predicted)*(1-actual))/sum(1-actual) as specificty,
ROW_NUMBER() over(order by cutoff desc) as rnum
into #sensepec
from #systems1
group by cutoff 

select * from #sensepec

---
select
sum(ABS(a.[specificty] - c.[specificty])
* (a.[sensivity] + c.[sensivity])/2) as Area
from #sensepec as a inner join #sensepec as c
on a.rnum = c.rnum -1; 