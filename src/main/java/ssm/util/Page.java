package ssm.util;



import java.util.List;
public class Page<T> {
	private int nowPage;//直接给
	private int totalQuqatity;//查询得到
	private List<T> list;//查询
	private int pageNumber;//直接给
	private int next;
	private int previous;
	private int totalPage;//计算
	private int start;
	public Page() {
		// TODO Auto-generated constructor stub
		this.nowPage = 1;
		this.next = 2;
		this.previous = 1;
		this.pageNumber=5;
		this.start = 0;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public void update(){
		this.totalPage = (this.totalQuqatity+this.pageNumber-1)/this.pageNumber;
		this.next = this.nowPage==this.totalPage?this.nowPage:(this.nowPage+1);
		this.previous = this.nowPage==1?1:(this.nowPage-1);
	}
	public void updateBefore(){
		this.start = (this.nowPage-1)*pageNumber;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalQuqatity() {
		return totalQuqatity;
	}
	public void setTotalQuqatity(int totalQuqatity) {
		this.totalQuqatity = totalQuqatity;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List list2) {
		this.list = list2;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getPrevious() {
		return previous;
	}
	public void setPrevious(int previous) {
		this.previous = previous;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public String toString(){
		return "当前页:"+this.getNowPage()+"下一页:"+this.getNext()+"页数:"+this.getTotalPage()+"总数量:"+this.getTotalQuqatity();
	}
}
