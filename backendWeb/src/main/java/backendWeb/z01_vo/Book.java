package backendWeb.z01_vo;
//backendWeb.z01_vo.Book	

public class Book {
	private String bname;
	private int serinum;
	private String borrowdate;
	private String returndate;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(String bname, int serinum, String borrowdate, String returndate) {
		this.bname = bname;
		this.serinum = serinum;
		this.borrowdate = borrowdate;
		this.returndate = returndate;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public int getSerinum() {
		return serinum;
	}

	public void setSerinum(int serinum) {
		this.serinum = serinum;
	}

	public String getBorrowdate() {
		return borrowdate;
	}

	public void setBorrowdate(String borrowdate) {
		this.borrowdate = borrowdate;
	}

	public String getReturndate() {
		return returndate;
	}

	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
	
	
}