package common;

public class CheckRegex {
    private static final String REGEX_NAME = "^([A-Z]{1}[a-z]{1,}\\s{1}){1,}([A-Z]{1}[a-z]{1,})+$";
    private static final String REGEX_PHONE = "^(091|090|\\(\\+84\\)90|\\(\\+84\\)91)\\d{7}+$";
    private static final String REGEX_ID_CARD = "^\\d{9}+$";
    private static final String REGEX_EMAIL = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
    private static final String REGEX_BIRTHDAY = "^(?:\\d{4}\\/(?:(?:(?:(?:0[13578]|1[02])\\/(?:0[1-9]|[1-2][0-9]|3[01]))|(?:(?:0[469]|11)\\/(?:0[1-9]|[1-2][0-9]|30))|(?:02\\/(?:0[1-9]|1[0-9]|2[0-8]))))|(?:(?:\\d{2}(?:0[48]|[2468][048]|[13579][26]))|(?:(?:[02468][048])|[13579][26])00)\\/02\\/29)$";


    public static boolean checkName(String value) {
        return value.matches(REGEX_NAME);
    }

    public static boolean checkPhone(String phone) {
        return phone.matches(REGEX_PHONE);
    }

    public static boolean checkIdCard (String idCard) {
        return idCard.matches(REGEX_ID_CARD);
    }

    public static boolean checkBirthday(String date) {
        return date.matches(REGEX_BIRTHDAY);
    }

    public static boolean checkEmail(String email) {
        return email.matches(REGEX_EMAIL);
    }
}
