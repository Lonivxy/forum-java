package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/20
 * @desc
 **/
public enum OptLogTypeEn {
    /**
     *
     */
    USER_LOGIN("USER_LOGIN", "用户登录记录"),
    USER_LOGOUT("USER_LOGOUT", "用户登出记录"),
    USER_REGISTER("USER_REGISTER", "用户注册记录"),
    ;

    private String value;
    private String desc;

    OptLogTypeEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static OptLogTypeEn getEntity(String value) {
        for (OptLogTypeEn userSexEn : values()) {
            if (userSexEn.getValue().equalsIgnoreCase(value)) {
                return userSexEn;
            }
        }

        return null;
    }
}
