package ssm.bean;
/*
 *王钢旗
 *2017年4月17日
 */
public class House extends Base {
	private String account;
	private String descr;
	private String floorid;
	private String cellid;
	private String bdate;//建筑年代，80年代或者90年代
	private String shape;//建筑风格
	private Double area;//面积
	private String owner;
	private Integer population;//房主家里人数
	private String ownerphone;
	private String mdate;//迁住日期
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getFloorid() {
		return floorid;
	}
	public void setFloorid(String floorid) {
		this.floorid = floorid;
	}
	public String getCellid() {
		return cellid;
	}
	public void setCellid(String cellid) {
		this.cellid = cellid;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public Double getArea() {
		return area;
	}
	public void setArea(Double area) {
		this.area = area;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public Integer getPopulation() {
		return population;
	}
	public void setPopulation(Integer population) {
		this.population = population;
	}
	public String getOwnerphone() {
		return ownerphone;
	}
	public void setOwnerphone(String ownerphone) {
		this.ownerphone = ownerphone;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
}
