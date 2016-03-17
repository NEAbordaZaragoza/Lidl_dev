global with sharing class LIDLRestResponsePost extends LIDLRestResponse{

	public static String CREATION_ERROR_MESSAGE = 'ERROR ON CREATING THE PRODUCT';
	public static Integer CREATION_ERROR_CODE = -101;

	private ProductRest product;

	public LIDLRestResponsePost(Integer code, String message, ProductRest product) {
		super(code, message);
		this.product = product;	
	}
}