package com.phmth.dto;

public class FormSearch {
	private String nameCategory;
	private String nameBrand;
	private String namePrice;

	public FormSearch() {
	}

	public FormSearch(String nameCategory, String nameBrand, String namePrice) {
		this.nameCategory = nameCategory;
		this.nameBrand = nameBrand;
		this.namePrice = namePrice;
	}

	public String getNameCategory() {
		return nameCategory;
	}

	public void setNameCategory(String nameCategory) {
		this.nameCategory = nameCategory;
	}

	public String getNameBrand() {
		return nameBrand;
	}

	public void setNameBrand(String nameBrand) {
		this.nameBrand = nameBrand;
	}

	public String getNamePrice() {
		return namePrice;
	}

	public void setNamePrice(String namePrice) {
		this.namePrice = namePrice;
	}

}
