package pub.developers.forum.common.enums;

import lombok.Getter;

/**
 * @author Qiangqiang.Bian
 * @create 2021/5/15
 * @desc
 **/
@Getter
public enum UserSourceEn {
    /**
     *
     */
    REGISTER("REGISTER", "注册"),
    GITHUB("GITHUB", "github"),
    ;

    private String value;
    private String desc;

    UserSourceEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public static UserSourceEn getEntity(String value) {
        for (UserSourceEn en : values()) {
            if (en.getValue().equalsIgnoreCase(value)) {
                return en;
            }
        }

        return null;
    }
}
