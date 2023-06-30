package backendWeb.z01_vo;
//backendWeb.z01_vo.Product
public class Product {
	private String pname;
	private int price;
	private int cnt;
	private String pinfo;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(String pname, int price, int cnt, String pinfo) {
		this.pname = pname;
		this.price = price;
		this.cnt = cnt;
		this.pinfo = pinfo;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getPinfo() {
		return pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	
	
}


