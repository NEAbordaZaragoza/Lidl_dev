@RestResource(urlMapping='/LIDL_Products/delete/*')
global with sharing class LIDL_POST_DELETE_v1 {
    
    @HttpPost 
    global static Product_LIDL__c deleteMethod(ProductRest product) {

        /*
        for(ProductRest item : listProductRest){
            if(item.article.articleId!=null){
                List<Integer> listarticleId = item.article.articleId;
            }
        }

        List<Product_LIDL__c> listProductLidl = new List<Product_LIDL__c>();
        listProductLidl = [SELECT id FROM Product_LIDL__c WHERE id_lidl_short__c IN : listarticleId];
        */

        Product_LIDL__c productLidl = new Product_LIDL__c();
        Integer articleId = Integer.valueOf(product.articleId);
        productlidl = [SELECT id FROM Product_LIDL__c WHERE article_id__c =: articleId];

        delete productlidl;

    return productlidl;
    }
}