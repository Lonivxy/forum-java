package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/12/2
 * @desc
 **/
public enum SearchTypeEn {
    POSTS("POSTS", "帖子"),
    ;

    private String value;
    private String desc;

    SearchTypeEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }
}
