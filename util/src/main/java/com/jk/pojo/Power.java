package com.jk.pojo;

public class Power {


	private Integer id;
	private String text;
	private Integer pid;
	private String icon;
	private String state;
	private String url;

	private Boolean checked;

	public Power() {
	}

	public Power(Integer id, String text, Integer pid, String icon, String state, String url, Boolean checked) {
		this.id = id;
		this.text = text;
		this.pid = pid;
		this.icon = icon;
		this.state = state;
		this.url = url;
		this.checked = checked;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "Power{" +
				"id=" + id +
				", text='" + text + '\'' +
				", pid=" + pid +
				", icon='" + icon + '\'' +
				", state='" + state + '\'' +
				", url='" + url + '\'' +
				", checked=" + checked +
				'}';
	}

	/* private Integer p_id;
      private String p_text;
      private Integer p_parentid;
      private String p_icon;
      private String p_state;
      private String p_url;

	private Boolean checked;


	public Power(Integer p_id, String p_text, Integer p_parentid, String p_icon, String p_state, String p_url, Boolean checked) {
		this.p_id = p_id;
		this.p_text = p_text;
		this.p_parentid = p_parentid;
		this.p_icon = p_icon;
		this.p_state = p_state;
		this.p_url = p_url;
		this.checked = checked;
	}

	public Power() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getP_id() {
		return p_id;
	}

	public void setP_id(Integer p_id) {
		this.p_id = p_id;
	}

	public String getP_text() {
		return p_text;
	}

	public void setP_text(String p_text) {
		this.p_text = p_text;
	}

	public Integer getP_parentid() {
		return p_parentid;
	}

	public void setP_parentid(Integer p_parentid) {
		this.p_parentid = p_parentid;
	}

	public String getP_icon() {
		return p_icon;
	}

	public void setP_icon(String p_icon) {
		this.p_icon = p_icon;
	}

	public String getP_state() {
		return p_state;
	}

	public void setP_state(String p_state) {
		this.p_state = p_state;
	}

	public String getP_url() {
		return p_url;
	}

	public void setP_url(String p_url) {
		this.p_url = p_url;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}


	@Override
	public String toString() {
		return "Power{" +
				"p_id=" + p_id +
				", p_text='" + p_text + '\'' +
				", p_parentid=" + p_parentid +
				", p_icon='" + p_icon + '\'' +
				", p_state='" + p_state + '\'' +
				", p_url='" + p_url + '\'' +
				", checked=" + checked +
				'}';
	}*/
}
