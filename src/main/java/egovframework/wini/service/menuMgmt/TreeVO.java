package egovframework.wini.service.menuMgmt;

import java.util.ArrayList;
import java.util.List;

public class TreeVO {

    private String id = "";
    private String text = "";
    private String state = "";

    List<TreeVO> children;

    public TreeVO() {

        this.id = "";
        this.text = "";
        this.state = "";

        this.children = new ArrayList<TreeVO>();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public List<TreeVO> getChildren() {

        return children;
    }

    public void setChildren(List<TreeVO> rows) {
        this.children = rows;
    }

    public void addChildren(TreeVO row) {
        this.children.add(row);
    }

}
