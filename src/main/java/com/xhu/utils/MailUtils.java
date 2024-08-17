package com.xhu.utils;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailUtils {

    private static MimeMessage message;
    static {
        try {
            Properties properties = new Properties();
            properties.load(MailUtils.class.getResourceAsStream("/mail.properties"));

            // 发件人邮箱用户名
            final String userName = properties.getProperty("username");

            final String password = properties.getProperty("password");
            properties.put("mail.smtp.auth", "true");
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    // 发件人邮件用户名、密码
                    return new PasswordAuthentication(userName, password);
                }
            });

            message = new MimeMessage(session);
            message.setFrom(new InternetAddress(userName));

            // 设置邮件消息发送的时间
            message.setSentDate(new Date());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送纯文本格式邮件
     * 
     * @param recipient 收件人
     * @param subject 主题
     * @param text 邮件文本内容
     * @return 邮件是否发送成功
     */
    public static boolean sendTextEmail(String recipient, String subject, String text) {
        try {

            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            // Set Subject: 头部头字段
            message.setSubject(subject);

            // 设置消息体
            message.setText(text);

            // 发送消息
            Transport.send(message);
            System.out.println("Sent message successfully....");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Sent message failed....");
            return false;
        }
    }

    /**
     * 发送HTML格式邮件
     * 
     * @param recipient 收件人
     * @param subject 主题
     * @param html 邮件内容HTML格式
     * @return 邮寄是否发送成功
     */
    public static boolean sendHtmlEmail(String recipient, String subject, String html) {
        try {

            // Set To: 头部头字段
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

            // Set Subject: 头部头字段
            message.setSubject(subject);

            // 创建消息部分
            BodyPart body = new MimeBodyPart();

            // 设置消息
            body.setContent(html, "text/html; charset=utf-8");

            // 创建多重消息
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(body);

            // 将MiniMultipart对象设置为邮件内容
            message.setContent(multipart);

            // 发送消息
            Transport.send(message);
            System.out.println("Sent message successfully....");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Sent message failed....");
            return false;
        }
    }

    /**
     * 发送HTML格式邮件
     */
    public static void sendHtml(String recipient, String subject, String title, String txt) {
        StringBuffer content = new StringBuffer();
        content.append("<html>");
        content.append("<body>");
        content.append("<h1>");
        content.append(title);
        content.append("</h1>");
        content.append("<p>"+txt+"</p>");
        content.append("</body>");
        content.append("</html>");

        System.out.println(sendHtmlEmail(recipient, subject, content.toString()));
    }
}
