package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/22
 * @desc
 **/
public enum MessageChannelEn {
    STATION_LETTER("STATION_LETTER", "站内信"),
    MAIL("MAIL", "邮件")
    ;

    private String value;
    private String desc;

    MessageChannelEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static MessageChannelEn getEntity(String value) {
        for (MessageChannelEn contentType : values()) {
            if (contentType.getValue().equals(value)) {
                return contentType;
            }
        }
        return null;
    }
}
