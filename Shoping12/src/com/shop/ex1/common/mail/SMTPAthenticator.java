package com.shop.ex1.common.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @author Ray
 *
 */
public class SMTPAthenticator extends Authenticator {

 protected PasswordAuthentication getPasswordAuthentication() {
  String username = "leebs126@gmail.com"; // gmail �����;
  String password = "dlqudtmd1";  // �н�����;
  return new PasswordAuthentication(username, password);
 }

}


