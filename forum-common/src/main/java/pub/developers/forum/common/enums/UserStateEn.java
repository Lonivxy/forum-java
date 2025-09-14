package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/12/8
 * @desc
 **/
public enum UserStateEn {
    /**
     *
     */
    UN_ACTIVATION("UN_ACTIVATION", "未激活"),
    ENABLE("ENABLE", "启用"),
    DISABLE("DISABLE", "禁用"),
    ;

    private String value;
    private String desc;

    UserStateEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static UserStateEn getEntity(String value) {
        for (UserStateEn userSexEn : values()) {
            if (userSexEn.getValue().equalsIgnoreCase(value)) {
                return userSexEn;
            }
        }

        return null;
    }
}
