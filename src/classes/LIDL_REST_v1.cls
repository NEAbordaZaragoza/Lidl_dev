@RestResource(urlMapping='/LIDL_Products_1/*')
global with sharing class LIDL_REST_v1 {

    @HttpPost  
    global static LIDLRestResponsePost postMethod() {
        //RestResponse res = RestContext.response;

        LIDLRestResponsePost response;
        try{
            List<ProductRest> listPr = deserializeProducts();
            List<Product_Lidl__c> listProductsInsert = new List<Product_Lidl__c>();
            for(ProductRest product :  listPr){
                listProductsInsert.add(ProductLidlConverter.from_rest_to_lidl(product));
            }
            
            insert listProductsInsert;
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
    global static LIDLRestResponsePut putMethod() {

        LIDLRestResponsePut response;
        try{
            List<ProductRest> listPr = deserializeProducts();
            //Prevalidaciones: Comprobar que los datos necesarios vienen informados.
            //Buscamos los ids que vamos a actualizar
            List<Product_Lidl__c> listProductsLidl = new List<Product_Lidl__c>();// = [Select Id, Name, Id_Lidl_Short__c From Product_Lidl__c Where Id_Lidl_Short__c = :Integer.valueOf(product.article.articleId)];
            if(listProductsLidl.size()<1){
                
            }else{
                Product_Lidl__c productLidl = listProductsLidl.get(0);
                productLidl.Name = 'Platano';
                update productLidl;
                response = new LIDLRestResponsePut(LIDLRestResponse.OK_CODE, 
                    LIDLRestResponse.OK_MESSAGE, null);
            }


        }catch(Exception e){
            response = managePutExceptions(e);
        }
        return response;

    }

    private static LIDLRestResponsePut managePutExceptions(Exception e){
        LIDLRestResponsePut response;
        RestResponse res = RestContext.response;
        if(e.getMessage().startsWith('PRODUCT_NOT_FOUND')){
            res.statusCode = 400;
            response = new LIDLRestResponsePut(LIDLRestResponsePut.UPDATE_ERROR_CODE, 
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

    private static List<ProductRest> deserializeProducts(){
        RestRequest res = RestContext.request;
        String body = res.requestBody.toString();
        body = body.replace('\"group\"', '\"groupName\"').replace('\"package\"','\"articlePackage\"');       
        return (List<ProductRest>) JSON.deserialize(body, List<ProductRest>.class);
    }

 }