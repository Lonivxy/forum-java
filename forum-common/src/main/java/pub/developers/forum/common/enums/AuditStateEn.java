package pub.developers.forum.common.enums;

/**
 * @author Qiangqiang.Bian
 * @create 2020/10/31
 * @desc
 **/
public enum AuditStateEn {
    /**
     *
     */
    WAIT("WAIT", "待审核"),
    PASS("PASS", "审核通过"),
    REJECT("REJECT", "审核拒绝"),
    ;

    private String value;
    private String desc;

    AuditStateEn(String value, String desc) {
        this.value = value;
        this.desc = desc;
    }

    public String getValue() {
        return value;
    }

    public String getDesc() {
        return desc;
    }

    public static AuditStateEn getEntity(String value) {
        for (AuditStateEn entity : values()) {
            if (entity.getValue().equalsIgnoreCase(value)) {
                return entity;
            }
        }

        return null;
    }

}
