import smtplib
import os
from email.header import Header
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

sender = os.environ.get("send_email")
password = os.environ.get("email_password")
user = os.environ.get("to_email")

def sendemail():
    test_info = "测试465端口"
    msg = MIMEText(test_info, "plain", "utf-8")

    msg["From"] = sender
    msg["To"] = user
    msg["subject"] = Header("测试邮件", "utf-8")

    try:
        server = smtplib.SMTP_SSL("smtp.163.com", 465)
        server.login(sender, password)
        server.sendmail(sender, [user, ], msg.as_string())
        server.quit()
        print("发送成功")
    except Exception as e:
        print("发送失败")
        print(e)
        

if __name__ == "__main__":
    sendemail()