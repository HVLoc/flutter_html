import 'package:flutter/material.dart';
import 'package:flutter_html_fork/flutter_html.dart';
import 'package:flutter_html_fork/html_parser.dart';
import 'package:flutter_html_fork/style.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = """
<table style="height: 356px; width: 100%; border-collapse: collapse;" border="1">
<tbody>
<tr style="height: 56px;">
<td style="width: 24.4615%; height: 34px; text-align: center;" rowspan="2" width="156">Loại giấy tờ</td>
<td style="width: 103.385%; height: 10px; text-align: center;" colspan="3" width="467">
<p style="text-align: center;">Thời hạn nộp (Hạn cuối)</p>
</td>
</tr>
<tr style="height: 24px;">
<td style="text-align: center; width: 24.4615%; height: 24px;" width="156">Theo tháng</td>
<td style="text-align: center; width: 24.6154%; height: 24px;" width="156">Theo quý</td>
<td style="text-align: center; width: 54.3077%; height: 24px;" width="156">Theo năm</td>
</tr>
<tr style="height: 24px;">
<td style="width: 24.4615%; height: 24px; text-align: center;" width="156"><strong>Thuế môn bài</strong></td>
<td style="width: 24.4615%; height: 24px; text-align: center;" width="156"></td>
<td style="width: 24.6154%; height: 24px; text-align: center;" width="156"></td>
<td style="text-align: center; width: 54.3077%; height: 24px;" width="156">30/1</td>
</tr>
<tr style="height: 48px;">
<td style="width: 24.4615%; height: 48px; text-align: center;" width="156"><strong>Thuế GTGT</strong></td>
<td style="width: 24.4615%; height: 48px; text-align: center;" width="156">Ngày 20 của tháng sau</td>
<td style="width: 24.6154%; height: 48px; text-align: center;" width="156">Ngày 30 của tháng đầu quý sau</td>
<td style="width: 54.3077%; height: 48px; text-align: center;" width="156"></td>
</tr>
<tr style="height: 48px;">
<td style="width: 24.4615%; height: 48px; text-align: center;" width="156"><strong>Thuế TNCN</strong></td>
<td style="width: 24.4615%; height: 48px; text-align: center;" width="156">Ngày 20 của tháng sau</td>
<td style="width: 24.6154%; height: 48px; text-align: center;" width="156">Ngày 30 của tháng đầu quý sau</td>
<td style="width: 54.3077%; height: 48px; text-align: center;" width="156"></td>
</tr>
<tr style="height: 10px;">
<td style="width: 24.4615%; height: 10px; text-align: center;" width="156"><strong>Thuế TNDN</strong></td>
<td style="width: 24.4615%; height: 10px; text-align: center;" width="156"></td>
<td style="width: 24.6154%; height: 10px; text-align: center;" width="156">Chỉ phải nộp số tiền tạm tính</p>
<p>Không phải nộp tờ khai</td>
<td style="width: 54.3077%; height: 10px; text-align: center;" width="156"></td>
</tr>
<tr style="height: 48px;">
<td style="width: 24.4615%; height: 48px; text-align: center;" width="156"><strong>Báo cáo tình hình sử dụng hóa đơn</strong></td>
<td style="width: 24.4615%; height: 48px; text-align: center;" width="156">Ngày 20 của tháng sau</td>
<td style="width: 24.6154%; height: 48px; text-align: center;" width="156">Ngày 30 của tháng đầu quý sau</td>
<td style="width: 54.3077%; height: 48px; text-align: center;" width="156"></td>
</tr>
<tr style="height: 144px;">
<td style="width: 24.4615%; height: 144px; text-align: center;" width="156"><strong>Báo cáo tài chính &amp; Quyết toán thuế TNDN, TNCN</strong></td>
<td style="width: 24.4615%; height: 144px; text-align: center;" width="156"></td>
<td style="width: 24.6154%; height: 144px; text-align: center;" width="156"></td>
<td style="width: 54.3077%; height: 144px; text-align: center;" width="156">Trong vòng 90 ngày kể từ ngày kết thúc năm dương lịch hoặc năm tài chính</p>
<p>(Hạn cuối là 30 hoặc 31/3)</td>
</tr>
</tbody>
</table>
""";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.black12,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
              alignment: Alignment.topLeft,
            ),
            "var": Style(fontFamily: 'serif'),
          },
          customRender: {
            "flutter": (RenderContext context, Widget child, attributes, _) {
              return FlutterLogo(
                style: (attributes['horizontal'] != null)
                    ? FlutterLogoStyle.horizontal
                    : FlutterLogoStyle.markOnly,
                textColor: context.style.color,
                size: context.style.fontSize.size * 5,
              );
            },
          },
          onLinkTap: (url) {
            print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
      ),
    );
  }
}
