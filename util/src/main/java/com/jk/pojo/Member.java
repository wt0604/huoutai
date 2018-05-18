package com.jk.pojo;
/*会员*/
public class Member  {
    private  Integer memberid;
    private  String membernum;
    private String membername;
    private String memberdj;
    private String memberjf;
    private String memberflag;
    private String memberdate;
    private String membersex;
    private String memberphone;
    private String memberidcard;

    @Override
    public String toString() {
        return "Member{" +
                "memberid=" + memberid +
                ", membernum='" + membernum + '\'' +
                ", membername='" + membername + '\'' +
                ", memberdj='" + memberdj + '\'' +
                ", memberjf='" + memberjf + '\'' +
                ", memberflag='" + memberflag + '\'' +
                ", memberdate='" + memberdate + '\'' +
                ", membersex='" + membersex + '\'' +
                ", memberphone='" + memberphone + '\'' +
                ", memberidcard='" + memberidcard + '\'' +
                '}';
    }

    public Integer getMemberid() {
        return memberid;
    }

    public void setMemberid(Integer memberid) {
        this.memberid = memberid;
    }

    public String getMembernum() {
        return membernum;
    }

    public void setMembernum(String membernum) {
        this.membernum = membernum;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public String getMemberdj() {
        return memberdj;
    }

    public void setMemberdj(String memberdj) {
        this.memberdj = memberdj;
    }

    public String getMemberjf() {
        return memberjf;
    }

    public void setMemberjf(String memberjf) {
        this.memberjf = memberjf;
    }

    public String getMemberflag() {
        return memberflag;
    }

    public void setMemberflag(String memberflag) {
        this.memberflag = memberflag;
    }

    public String getMemberdate() {
        return memberdate;
    }

    public void setMemberdate(String memberdate) {
        this.memberdate = memberdate;
    }

    public String getMembersex() {
        return membersex;
    }

    public void setMembersex(String membersex) {
        this.membersex = membersex;
    }

    public String getMemberphone() {
        return memberphone;
    }

    public void setMemberphone(String memberphone) {
        this.memberphone = memberphone;
    }

    public String getMemberidcard() {
        return memberidcard;
    }

    public void setMemberidcard(String memberidcard) {
        this.memberidcard = memberidcard;
    }
}
