package edu.sacredgarden.dto;

//출고
public class Serve {
    private int serno;  // 출고 번호
    private int sno;        //결제번호 티폴트는 0,
    private int pno;        //출고 제품번호
    private int amount;     //출고량
    private int sprice;     //출고 가격
    private String resdate; //출고일

    public int getSerno() {
        return serno;
    }

    public void setSerno(int serno) {
        this.serno = serno;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public int getPno() {
        return pno;
    }

    public void setPno(int pno) {
        this.pno = pno;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getSprice() {
        return sprice;
    }

    public void setSprice(int sprice) {
        this.sprice = sprice;
    }

    public String getResdate() {
        return resdate;
    }

    public void setResdate(String resdate) {
        this.resdate = resdate;
    }

    @Override
    public String toString() {
        return "Serve{" +
                "serno=" + serno +
                ", sno=" + sno +
                ", pno=" + pno +
                ", amount=" + amount +
                ", sprice=" + sprice +
                ", resdate='" + resdate + '\'' +
                '}';
    }
}
