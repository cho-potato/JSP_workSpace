package store.domain;

import lombok.Data;

@Data
public class Store {
	private int store_idx;
	private double lati;
	private double longi;
	private String store_name;
	private Category category;
	
}
