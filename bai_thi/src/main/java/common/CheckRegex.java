package common;

public class CheckRegex {
    private static final String REGEX_NAME = "^([A-Z][a-z]+\\s)+([A-Z][a-z]+)+$";
    private static final String REGEX_BIRTHDAY = "^(?:\\d{4}\\-(?:(?:(?:(?:0[13578]|1[02])\\-(?:0[1-9]|[1-2][0-9]|3[01]))|(?:(?:0[469]|11)\\-(?:0[1-9]|[1-2][0-9]|30))|(?:02\\-(?:0[1-9]|1[0-9]|2[0-8]))))|(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26]))|(?:(?:[02468][048])|[13579][26])00)\\-02\\-29)$";

    public static boolean checkName(String name) {
        return name.matches(REGEX_NAME);
    }

    public static boolean checkBirthday(String birthday) {
        return birthday.matches(REGEX_BIRTHDAY);
    }
}
