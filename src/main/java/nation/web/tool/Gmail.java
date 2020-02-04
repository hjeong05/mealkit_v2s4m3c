package nation.web.tool;

import javax.mail.Authenticator;//?ù∏Ï¶?
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {


    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication("a01092038223@gmail.com","guddl42513");
    }
}