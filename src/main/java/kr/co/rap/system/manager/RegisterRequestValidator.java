package kr.co.rap.system.manager;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegisterRequestValidator implements Validator {
    private static final String idAndPasswordExp = "^[a-zA-Z0-9]*$";
    private static final String nameExp = "^[ㄱ-ㅎ가-힣]*$";
    private static final String contaxtExp ="^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$";

    @Override
    public boolean supports(Class<?> clazz) {
        return Manager.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        Manager manager = (Manager) target;

        if (30 < manager.getId().length()) {
            errors.rejectValue("id", "아이디는 최대 30자 입니다.");
        } else {
            if (!Pattern.matches(idAndPasswordExp, manager.getId())) {
                errors.rejectValue("id", "아이디는 영문 및 숫자만 입력이 가능합니다");
            }
        }

        if (manager.getPassword().length() < 8) {
            errors.rejectValue("password", "비밀번호는 최소 8자 입니다.");

        } else {
            if (!Pattern.matches(idAndPasswordExp, manager.getPassword())) {
                errors.rejectValue("password", "비밀번호는 영문 및 숫자만 입력이 가능합니다.");
            }
        }

        if (manager.getName().length() > 33) {
            errors.rejectValue("name", "이름은 최대 33자 입니다.");
        } else {
            if (!Pattern.matches(nameExp, manager.getName())) {
                errors.rejectValue("name", "이름은 한글만 가능 합니다.");
            }
        }

        if (!Pattern.matches(contaxtExp, manager.getContact())) {
            errors.rejectValue("contact", "전화번호를 정확히 입력해 주세요.");
        }
    }
}
