global virtual class LIDLRestResponse {
	public static String OK_MESSAGE = 'OK';
	public static Integer OK_CODE = 0;

	public static String ERROR_MESSAGE = 'ERROR';
	public static Integer ERROR_CODE = -1;

	private Integer code;
	private String message;

	public LIDLRestResponse(Integer code, String message) {
		this.code = code;
		this.message = message;
	}
}