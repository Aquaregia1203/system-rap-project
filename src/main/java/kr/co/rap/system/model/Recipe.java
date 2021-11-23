package kr.co.rap.system.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Recipe implements Serializable {
    private int no;
    private String name;
    private int usedCount;
    private Date addDate;
    private List<Mix> mixList;

    public Recipe() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUsedCount() {
        return usedCount;
    }

    public void setUsedCount(int usedCount) {
        this.usedCount = usedCount;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public List<Mix> getMixList() {
        return mixList;
    }

    public void setMixList(List<Mix> mixList) {
        this.mixList = mixList;
    }
}
