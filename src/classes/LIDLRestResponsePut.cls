global with sharing class LIDLRestResponsePut extends LIDLRestResponse{
	public static String UPDATE_ERROR_MESSAGE = 'ERROR ON UPDATING PRODUCT';
	public static Integer UPDATE_ERROR_CODE = -101;

	private ProductRest product;

	public LIDLRestResponsePut(Integer code, String message, ProductRest product) {
		super(code, message);
		this.product = product;	
	}
}