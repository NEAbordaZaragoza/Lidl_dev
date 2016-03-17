@RestResource(urlMapping='/LIDL_Products_1/*')
global with sharing class LIDL_REST_v1 {

    @HttpPost  
    global static LIDLRestResponsePost postMethod(ProductRest product) {
        //RestResponse res = RestContext.response;
        LIDLRestResponsePost response;
        try{

            Product_Lidl__c productLidl = ProductLidlConverter.from_rest_to_lidl(product);
            //Prevalidaciones: Comprobar que los datos necesarios vienen informados
            insert productLidl;
            response = new LIDLRestResponsePost(LIDLRestResponse.OK_CODE, 
                LIDLRestResponse.OK_MESSAGE, null);

        }catch(Exception e){
            response = managePostExceptions(e);
        }
        return response;
    }

    private static LIDLRestResponsePost managePostExceptions(Exception e){
        LIDLRestResponsePost response;
        RestResponse res = RestContext.response;
        if(e.getMessage().equals('')){
            res.statusCode = 400;
            response = new LIDLRestResponsePost(LIDLRestResponsePost.CREATION_ERROR_CODE, 
                LIDLRestResponsePost.CREATION_ERROR_MESSAGE, null);
        }else if(e.getMessage().startsWith('VALIDATION_ERROR')){
            res.statusCode = 400;
            response = new LIDLRestResponsePost(LIDLRestResponsePost.CREATION_ERROR_CODE, 
                e.getMessage(), null);
            //response.code = 123123;
            //response.message = 'error 123213';
        }else{
            res.statusCode = 500;
            //response.code = 500;
            //response.message = 'Not expected error: ' + e.getMessage();
        }
        return response;
    }


    @HttpPut
    global static LIDLRestResponsePost putMethod(ProductRest product) {

        LIDLRestResponsePost response;
        try{

            //Prevalidaciones: Comprobar que los datos necesarios vienen informados.
            //Buscamos los ids que vamos a actualizar
            List<Product_Lidl__c> listProductsLidl = new List<Product_Lidl__c>();// = [Select Id, Name, Id_Lidl_Short__c From Product_Lidl__c Where Id_Lidl_Short__c = :Integer.valueOf(product.article.articleId)];
                
            if(listProductsLidl.size()<1){
                
            }else{
                Product_Lidl__c productLidl = listProductsLidl.get(0);
                productLidl.Name = 'Platano';
                update productLidl;
                response = new LIDLRestResponsePost(LIDLRestResponse.OK_CODE, 
                    LIDLRestResponse.OK_MESSAGE, null);
            }


        }catch(Exception e){
            response = managePutExceptions(e);
        }
        return response;

    }

    private static LIDLRestResponsePost managePutExceptions(Exception e){
        LIDLRestResponsePost response;
        RestResponse res = RestContext.response;
        if(e.getMessage().equals('')){
            res.statusCode = 400;
            response = new LIDLRestResponsePost(LIDLRestResponsePost.CREATION_ERROR_CODE, 
                LIDLRestResponsePost.CREATION_ERROR_MESSAGE, null);
        }else if(e.getMessage().startsWith('PRODUCT_NOT_FOUND')){
            res.statusCode = 400;
            response = new LIDLRestResponsePost(LIDLRestResponsePost.CREATION_ERROR_CODE, 
                e.getMessage(), null);
            //response.code = 123123;
            //response.message = 'error 123213';
        }else{
            res.statusCode = 500;
            //response.code = 500;
            //response.message = 'Not expected error: ' + e.getMessage();
        }
        return response;
    }

 }