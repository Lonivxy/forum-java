package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/31
 * @desc
 **/
public enum PostsCategoryEn {
    ARTICLE("ARTICLE", "文章"),
    FAQ("FAQ", "问答"),
    ;

    private String value;
    private String desc;

    PostsCategoryEn(String value, String desc) {
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
