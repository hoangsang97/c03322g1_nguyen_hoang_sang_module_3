package common;

public class CheckRegex {
    private static final String REGEX_NAME = "^[a-zA-Z]+$";

    public static boolean checkName(String value) {
        return value.matches(REGEX_NAME);
    }
}
