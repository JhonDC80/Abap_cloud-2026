@AbapCatalog.sqlViewName: 'ZCDS_V_ART_JD_01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista articulos arte'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view ZCDS_ART_JD_01
  as select from zdt_jd_art
{
  key client as client,
  key id_art as idArt,
      descr  as Descr,
      descr2 as desc2,
      color  as Color,
      piezas as Piezas,
      stock  as Stock,
      url    as url,
      
      
      // 0 neutral grey
      // 1 negative red
      // 2 critical yellow
      // 3 positive green
      
      
      case
          when stock = 0 then 0
          when stock between 1 and 10 then 1
          when stock between 11 and 99 then 2
          when stock >= 100 then 3
      else 0
      end as status
          
     
}
