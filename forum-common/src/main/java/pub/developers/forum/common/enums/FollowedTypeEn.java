package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/11/20
 * @desc
 **/
public enum FollowedTypeEn {
    USER("USER", "用户"),
    POSTS("POSTS", "帖子"),
    ;
    private String value;
    private String desc;

    FollowedTypeEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static FollowedTypeEn getEntity(String value) {
        for (FollowedTypeEn contentType : values()) {
            if (contentType.getValue().equals(value)) {
                return contentType;
            }
        }
        return null;
    }
}
