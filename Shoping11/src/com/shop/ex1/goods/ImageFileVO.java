package com.shop.ex1.goods;

public class ImageFileVO {
	private String id;
	private String image_id;
	private String goods_id;
	private String fileName;
	private String fileType;
	

	public ImageFileVO() {
		super();
	}

	
	


	public String getImage_id() {
		return image_id;
	}



	public void setImage_id(String image_id) {
		this.image_id = image_id;
	}

	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}

	public String getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(String goods_id) {
		this.goods_id = goods_id;
	}


	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	

}
