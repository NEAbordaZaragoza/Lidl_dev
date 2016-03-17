public with sharing class ProductLidlConverter {
 
  public static Product_Lidl__c from_rest_to_lidl(ProductRest productRest){
  //from_ProductRest_to_Product_Lidl__c;
  Product_Lidl__c product = new Product_Lidl__c();
  
  product.group_id__c = Decimal.Valueof(productRest.groupId);
  product.group_name__c = productRest.groupname;
  product.subgroup_Id__c = Decimal.valueof(productRest.subgroupId);
  product.subgroup_name__c = productRest.subgroup;
  product.family_id__c = Decimal.valueof(productRest.familyId);
  product.family_name__c = productRest.family;
  product.article_id__c = Decimal.valueof(productRest.ArticleId);
  product.name = productRest.Name;
  product.article_package__c = Decimal.valueof(productRest.articlePackage);
  product.article_type__c = productRest.type;
  /*product.article_images__c = */
    
  return product;
  
  
 }

 public static ProductRest from_lidl_to_rest(Product_Lidl__c productLidl){
  //from_Product_Lidl__c_to_ProductRest
  ProductRest product = new ProductRest();
  
  product.groupId = String.valueof(productLidl.group_id__c);
  product.groupname = productLidl.group_name__c;
  product.subgroupId = String.valueof(productLidl.subgroup_Id__c);
  product.subgroup = productlidl.subgroup_name__c;
  product.familyId = String.valueof(productlidl.family_id__c);
  product.family = productlidl.family_name__c;
  product.ArticleId = String.valueof(productlidl.article_id__c);
  product.Name = productlidl.name;
  product.articlePackage = String.valueof(productlidl.article_package__c);
  product.type = productlidl.article_type__c;
  /*product.article.images = */
  
      
  return product;
 }
 
}