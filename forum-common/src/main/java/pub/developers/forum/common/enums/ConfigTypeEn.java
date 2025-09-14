package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/12/26
 * @desc
 **/
public enum ConfigTypeEn {

    /**
     * 首页轮播图
     */
    HOME_CAROUSEL("HOME_CAROUSEL", "首页轮播图"),

    /**
     * 侧边栏轮播图
     */
    SIDEBAR_CAROUSEL("SIDEBAR_CAROUSEL", "侧边栏轮播图"),
    ;

    private String value;
    private String desc;

    ConfigTypeEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static ConfigTypeEn getEntity(String value) {
        for (ConfigTypeEn contentType : values()) {
            if (contentType.getValue().equals(value)) {
                return contentType;
            }
        }
        return null;
    }

}
