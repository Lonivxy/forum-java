package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/22
 * @desc
 **/
public enum MessageContentTypeEn {
    HTML("HTML", "html"),
    TEXT("TEXT", "text"),
    ;

    private String value;
    private String desc;

    MessageContentTypeEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static MessageContentTypeEn getEntity(String value) {
        for (MessageContentTypeEn contentType : values()) {
            if (contentType.getValue().equals(value)) {
                return contentType;
            }
        }
        return null;
    }
}
