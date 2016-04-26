package com.shop.ex1.common.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @author Ray
 *
 */
public class SMTPAthenticator extends Authenticator {

 protected PasswordAuthentication getPasswordAuthentication() {
  String username = "leebs126@gmail.com"; // gmail 사용자;
  String password = "dlqudtmd1";  // 패스워드;
  return new PasswordAuthentication(username, password);
 }

}


