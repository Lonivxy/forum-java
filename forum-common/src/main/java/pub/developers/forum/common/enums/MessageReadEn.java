package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/12/5
 * @desc
 **/
public enum MessageReadEn {
    YES("YES", "已读"),
    NO("NO", "未读")
    ;

    private String value;
    private String desc;

    MessageReadEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static MessageReadEn getEntity(String value) {
        for (MessageReadEn contentType : values()) {
            if (contentType.getValue().equals(value)) {
                return contentType;
            }
        }
        return null;
    }

}
