public with sharing class ProductLidlConverter {
 
  public static Product_Lidl__c from_rest_to_lidl(ProductRest productRest){
  //from_ProductRest_to_Product_Lidl__c;
  Product_Lidl__c product = new Product_Lidl__c();
  
  product.group_id__c = Decimal.Valueof(productRest.article.groupId);
  product.group_name__c = productRest.article.groupname;
  product.subgroup_Id__c = Decimal.valueof(productRest.article.subgroupId);
  product.subgroup_name__c = productRest.article.subgroup;
  product.family_id__c = Decimal.valueof(productRest.article.familyId);
  product.family_name__c = productRest.article.family;
  product.article_id__c = Decimal.valueof(productRest.article.ArticleId);
  product.name = productRest.article.Name;
  product.article_package__c = Decimal.valueof(productRest.article.articlePackage);
  product.article_type__c = productRest.article.type;
  /*product.article_images__c = */
    
  return product;
  
  
 }

 public static ProductRest from_lidl_to_rest(Product_Lidl__c productLidl){
  //from_Product_Lidl__c_to_ProductRest
  ProductRest product = new ProductRest();
  
  product.article.groupId = String.valueof(productLidl.group_id__c);
  product.article.groupname = productLidl.group_name__c;
  product.article.subgroupId = String.valueof(productLidl.subgroup_Id__c);
  product.article.subgroup = productlidl.subgroup_name__c;
  product.article.familyId = String.valueof(productlidl.family_id__c);
  product.article.family = productlidl.family_name__c;
  product.article.ArticleId = String.valueof(productlidl.article_id__c);
  product.article.Name = productlidl.name;
  product.article.articlePackage = String.valueof(productlidl.article_package__c);
  product.article.type = productlidl.article_type__c;
  /*product.article.images = */
  
      
  return product;
 }
 
}