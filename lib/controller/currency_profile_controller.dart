import 'package:currency_app/model/currency.dart';
import 'package:get/get.dart';

class CurrencyProfileController extends GetxController {
  CurrencyModel? currency;
  List? storyList = [
    'دلار آمریکا یکای پول رسمی ایالات متحده آمریکا است. کنگره ایالات متحده آمریکا در ۶ ژوئیه ۱۷۸۵ (که در آن زمان، تنها یک مجلس بود) به اتفاق آرا دلار را یکای پول آن کشور قرار داد. پیش از استقلال ایالات متحده یعنی در ۴ ژوئیه ۱۷۷۶، پول انگلستان (لیره) در ۱۳ مهاجرنشین انگلیسی آمریکای شمالی رایج بود. در جریان انقلاب، آمریکاییان سکه نقره‌ای اسپانیا به نام «دلار» را که در مکزیک رایج بود وسیله داد و ستد قرار دادند و به همین دلیل نام پول ملی خود را «دلار» گذاشتند. سکه دلار نقره‌ای از قرن چهاردهم بیش از سه قرن به نام «تالر، دالر، تلار و دلار» در اروپا رایج بود که اسپانیایی‌ها آن را حفظ کردند و به مستعمرات خود در قاره آمریکا منتقل ساختند. \nعلامت \$ برای دلار آمریکا و بسیاری از کشورهای دیگر استفاده می‌شود. در قرن ۱۸ میلادی ps برای پزو استفاده می‌شد و به مرور دو حرف s و p به هم چسبیده شده و علامت \$ را تشکیل دادند. اس با خط عمودی «\$» که علامت بین‌المللی دلار است نیز از اسپانیایی‌ها اقتباس شده که پول خود را با علامت P (پی) مشخص می‌کردند و این "P" در آمریکای شمالی به تدریج و در جریان نوشتن به شکل «\$» درآمد',
    'یورو (به الفبای لاتین: Euro) (نماد: €) یکای پول کشورهای منطقه یورو است که به ۱۰۰ سنت تقسیم می‌شود. به‌کارگیری یورو در یکم ژانویه سال ۲۰۰۲ رسماً در کشورهای آلمان، فرانسه، بلژیک، اتریش، اسپانیا، پرتغال، یونان، ایتالیا، ایرلند، لوکزامبورگ، هلند و فنلاند آغاز شد و اکنون در ۱۹ کشور از ۲۷ عضو اتحادیه اروپا به‌طور رسمی در جریان است.\nیورو بیرون از اروپا نیز در برخی از بازمانده‌های مستعمرات کشورهای اروپایی نظیر گویان فرانسه، گوادلوپ، مارتینیک، مایوت، رئونیون، جزایر قناری و سن-پیر و میکلون رایج است. \nضرب هر سکه (سنت) یا (یورو) در هر کشور عضو منطقه یورو شکل خاص و طرح خودش را دارد. سکه‌های ضرب هلند، اسپانیا، فنلاند، آلمان، فرانسه و… با یکدیگر متفاوت هستند.',
    'درهم یکای پول کشور امارات متحده عربی است. کد ایزو ۴۲۱۷ که برای درهم امارات در نظر گرفته شده‌است AED می‌باشد، اما در متون غیررسمی از علامت اختصاری DH یا DHs نیز استفاده می‌گردد. هر درهم برابر با ۱۰۰ فلس است.',
    'کرون (به سوئدی: krona) از سال ۱۸۷۳ یکای پول سوئد می‌باشد. کد ایزوی SEK و kr برای این یکای پول استفاده می‌شود. کرون به سوئدی به معنای تاج می‌باشد. کرون به همراه یورو در جزایر آلند نیز استفاده می‌شود.',
    'درام (به ارمنی: դրամ) نام یکای پول جمهوری ارمنستان است. خود واژهٔ درام از «درم» پارسی میانه وارد زبان ارمنی شده. پارسی میانه خود، این واژه را از واژه یونانی دراخما وام گرفته بود. تلفظ‌های گوناگونی از آن واژه در خاورمیانه رواج گرفت مانند درم، درهم و درام. \nامروز در زبان ارمنی واژه درام معنی پول نیز می‌دهد. در ژوئیهٔ ۲۰۱۸ میلادی، هر دلار ایالات متحدۂ آمریکا حدوداً برابر ۵۰۶٫۴۶ درام بوده‌است.',
    'یکای پول کشور پاکستان روپیه است. هر روپیهٔ پاکستان برابر با صد پیسه است. انتشار این یکای پول تحت نظر بانک دولتی پاکستان است. هر لک برابر با صدهزار روپیه و هر کرور هم برابر با ده میلیون روپیه است.',
    'ریال سعودی یکای پول عربستان است. هر ریال عربستان به ۱۰۰ هلالة تقسیم می‌شود و هر ۵ هلالة برابر با یک قرش است. کد ایزو ۴۲۱۷ این یکای پول SAR است.',
    'روپیه یکای پول رسمی هندوستان با علامت ₹ است. روپیهِ هند به عنوان پول قانونی در کشورهای همسایه نپال و بوتان پذیرفته شده‌است و این دو کشور پول رایج خود را بر اساس نرخ روپیهِ هند تثبیت کرده‌اند. روپیه به ۱۰۰ پیسه تقسیم می‌شود. ارزش بالاترین اسکناس کاغذی معادل دو هزار روپیه‌است و بی‌ارزش‌ترین سکه رایج در هند ۵۰ پیسه است. در سال ۲۰۱۶ اسکناس هزار روپیه حذف و به‌جای آن اسکناس دوهزار روپیه وارد شد.',
    'ریال قطر (به انگلیسی: Qatari riyal) (به زبان بومی: ریال قطری) با کد ایزوی QAR، یکای پول رایج در کشور قطر است. مسئولیت کنترل این یکای پول برعهدهٔ بانک مرکزی قطر قرار دارد.',
    'رینگیت نام یکای پول کشور مالزی است که با کد ایزو ۴۲۱۷ MYR مشخص می‌شود. رینگیت جانشین دلار مالزی از سال ۱۹۷۵ میلادی شده‌است و به ۱۰۰ یکای کوچک‌تر که سن یا سنت نامیده می‌شود، تقسیم می‌گردد.',
    'دلار نیوزیلند (به انگلیسی: New Zealand dollar) (به زبان بومی: Tāra o Aotearoa) با کد ایزوی NZD، یکای پول رایج در کشور نیوزلند است. مسولیت کنترل این یکای پول برعهدهٔ بانک مرکزی نیوزلند قرار دارد.',
    'دینار بحرین یکای پول رایج در کشور بحرین است.دینار بحرین به ۱۰۰۰ فلس تقسیم می‌شود. کلمهٔ دینار از کلمهٔ رومی دیناریوس گرفته شده‌است. دینار در سال ۱۹۶۵ به ازای هر ۱۰ روپیه خلیج‌فارس برابر با ۱ دینار معرفی شد.',
    'کرون (به نروژی: krone) تلفظ [ˈkɾu:nə] (یا کرونا krona[۱][۲]) (نماد: kr; کد ایزو ۴۲۱۷: NOK) یکای پول نروژ است. حالت جمع آن به نروژی کرونر (به نروژی: kroner) یا کرونور(به نروژی: kronor)[۳]است؛ که هر کرون برابر ۱۰۰ اوره (به نروژی: øre) است و سکه‌های با ۵۰ اوره، ۱، ۵٬۱۰ و ۲۰ کرونی نیز ضرب می‌شود و اسکناس‌های آن ۵۰، ۱۰۰، ۲۰۰، ۵۰۰، و ۱۰۰۰ کرونی هستند.',
    'دینار یکای پول کشور عراق است. ارائهٔ دینار توسط بانک مرکزی عراق انجام می‌گیرد.\nاین واژه از دیناریوس که یکای پول امپراتوری روم بود گرفته شده است. جمع این واژه در فارسی دینارها و در عربی دنانیر است.\nدینار عراقی از سال ۱۹۳۱ به گردش افتاد و از آن زمان تاکنون چند نوع از وجود داشته و به کار رفته است.\nدر زمان حکومت بعث در نواحی تحت سیطره حکومت مرکزی دینار طبع یا تزویر (تقلبی به‌صورت کپی رنگی) رواج داشت در حالی که در نواحی خودگردان کردستان در شمال دینار سویسری (سوئیسی) استفاده می‌شده است که ارزش آن به مراتب بیشتر از دینار تزویر است. بعد از سقوط رژیم بعث، در نواحی مرکزی و جنوبی دینار بسیار کم ارزشتری از دینار تزویر رواج یافته است در تصویر به کار رفته در این دینار جدید به جای تصویر "صدام" نقش "ابن هیثم" وجود دارد.',
    'فرانک سوئیس، (به انگلیسی: Swiss franc) (به فرانسوی: Franc suisse) (به آلمانی: Schweizer franken) با کد ایزو ۴۲۱۷ CHF یکای پول کشورهای سوئیس و لیختن اشتاین می‌باشد. ارزش آن تقریباً برابر ۱ دلار آمریکا و مانند پول آمریکا هر ۱ فرانک مساوی ۱۰۰ سانتیم است.',
  ];
  List? imageList = [
    'assets/images/dollar.jpg',
    'assets/images/euro.jpg',
    'assets/images/dirham.jpg',
    'assets/images/corn.jpg',
    'assets/images/deram.jpg',
    'assets/images/ropye.jpg',
    'assets/images/rial.jpg',
    'assets/images/ropye_india.jpg',
    'assets/images/rial_qatar.jpg',
    'assets/images/ringgit.jpg',
    'assets/images/nzd.jpg',
    'assets/images/dinar.jpg',
    'assets/images/corn_norvjh.jpg',
    'assets/images/irq.jpg',
    'assets/images/frank.jpg',
  ];

  @override
  void onInit() {
    super.onInit();
    currency = Get.arguments;
  }
}
