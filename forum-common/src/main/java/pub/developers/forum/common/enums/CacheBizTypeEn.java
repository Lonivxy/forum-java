package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/20
 * @desc
 **/
public enum CacheBizTypeEn {
    USER_LOGIN_TOKEN("USER_LOGIN_TOKEN", "用户登录凭证 token"),
    TAG_USED("TAG_USED", "已使用标签")
    ;

    private String value;
    private String desc;

    CacheBizTypeEn(String value, String desc) {
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
