<div align="center">

<img src="assets/logo3.png" width="240" alt="Quilo Cleaner logo2">

 # Quilo Cleaner



### ابزار مدیریت و پاک‌سازی خودکار انجمن‌های تلگرام
<bar>

---

## معرفی Quilo Cleaner
</div>

 
 یک ابزار خط فرمان برای مدیریت ربات‌های تلگرام و پاک‌سازی خودکار پیام‌های انجمن‌ها و گپ های تاپیک است. 

</div>

<div dir="rtl">

این پروژه به‌صورت باینری منتشر می‌شود و سورس اصلی آن خصوصی است.

# قابلیت‌ها

مدیریت چند ربات تلگرام

افزودن، ویرایش و حذف ربات‌ها

مدیریت اتصال‌ها و Topicها

اجرای Worker به‌صورت سرویس systemd

نصب خودکار و امن

حفظ تنظیمات هنگام نصب مجدد

بررسی امضای دیجیتال و هش فایل‌ها

منوی ساده و تعاملی

نگهداری اطلاعات در مسیر محافظت‌شده

# پیش‌نیازها
</div>

<div dir="ltr" align="right">

Ubuntu یا Debian

</div>

<div dir="rtl">



معماری x86_64

دسترسی root یا sudo

اینترنت برای دریافت فایل‌های انتشار

# نصب اسان

برای نصب اسان از طریق دستور زیر استفاده نمایید.
</div>

```bash
curl -fsSL https://raw.githubusercontent.com/aliasgharshams/Quilo-cleaner/main/install.sh | sudo bash
```

<div dir="rtl">

نصب‌کننده به‌صورت خودکار:

وابستگی‌های لازم را نصب می‌کند.

آخرین نسخه را از GitHub دریافت می‌کند.

امضای Minisign و هش SHA-256 را بررسی می‌کند.

باینری‌ها و سرویس را نصب می‌کند.

اطلاعات قبلی ربات‌ها را حفظ می‌کند.

# اجرای پنل

</div>

```bash
sudo quilo-cleaner
```

<div dir="rtl">

# وضعیت سرویس

</div>

```bash
sudo systemctl status quilo-cleaner
```

<div dir="rtl">
 
# مشاهده لاگ‌های سرویس:

</div>

```bash
sudo journalctl -u quilo-cleaner -n 100 --no-pager
```

<div dir="rtl">

# حذف برنامه

از داخل منوی Quilo Cleaner گزینه Uninstall System را انتخاب کنید.

اطلاعات ربات‌ها ممکن است برای نصب بعدی نگه‌داری شوند. پیش از حذف کامل، از فایل تنظیمات نسخه پشتیبان بگیرید.

# بروزرسانی

برای دریافت آخرین نسخه، همان دستور نصب را دوباره اجرا کنیدیا در منو گزینه 7 را بزنید:

</div>

```bash
curl -fsSL https://raw.githubusercontent.com/aliasgharshams/Quilo-cleaner/main/install.sh | sudo bash
```

<div dir="rtl">


# کانال تلگرام
```bash
https://t.me/Quilo_chanell
```



# پشتیبانی
```bash
https://t.me/Quilo_support
```

ساخته‌شده برای مدیریت ساده‌تر انجمن‌های تلگرام

# Quilo-cleaner

</div>


