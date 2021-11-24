package kr.co.rap.system.recipe;

import java.io.Serializable;
import java.util.List;

public class Recipe implements Serializable {
    private int no;
    private String name;
    private int usedCount;
    private String addDate;
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

    public String getAddDate() {
        return addDate;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }

    public List<Mix> getMixList() {
        return mixList;
    }

    public void setMixList(List<Mix> mixList) {
        this.mixList = mixList;
    }
}
