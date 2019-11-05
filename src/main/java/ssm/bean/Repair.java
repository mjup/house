package ssm.bean;
/*
 *王钢旗
 *2017年4月20日
 */
public class Repair {
	private String id;
	private String houseid;
	private String category;//水表,电表,燃气表,水管,电线,燃气管,其他
	private String descr;
	private String reportdate;
	private Integer means;//保修方式
	private Integer status;
	private String repairdate;
	private String principal;
	private Double material;
	private Double upkeep;
	private String completedate;
	private String paydate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHouseid() {
		return houseid;
	}
	public void setHouseid(String houseid) {
		this.houseid = houseid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getReportdate() {
		return reportdate;
	}
	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	public Integer getMeans() {
		return means;
	}
	public void setMeans(Integer means) {
		this.means = means;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getRepairdate() {
		return repairdate;
	}
	public void setRepairdate(String repairdate) {
		this.repairdate = repairdate;
	}
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	public Double getMaterial() {
		return material;
	}
	public void setMaterial(Double material) {
		this.material = material;
	}
	public Double getUpkeep() {
		return upkeep;
	}
	public void setUpkeep(Double upkeep) {
		this.upkeep = upkeep;
	}
	public String getCompletedate() {
		return completedate;
	}
	public void setCompletedate(String completedate) {
		this.completedate = completedate;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
}
