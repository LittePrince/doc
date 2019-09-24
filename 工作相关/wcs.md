出库整体流程

```sequence
WMS->ERP:拉取发货清单
ERP->WMS:响应
WMS->TMS:获取发货信息
TMS->WMS:响应
note over  WMS,TMS: 此处处理
WMS->WMS:由tms的响应知道要几个空箱，分别放什么货
WMS->前台:分配拣货出库任务

```

订单转为出货单，由tms来调用RPC接口

```sequence
title: 订单转erp波次策略请求url：/wms/waveSortPolicy/erp
RPC->WaveSortPolicyController:post 订单
WaveSortPolicyController->WavePolicyManager:generateWavePolicyErpByDeliveries
WavePolicyManager->waveSortPolicyErpRepository:save
waveSortPolicyErpRepository->WavePolicyManager:return policyErp
WavePolicyManager->WaveSortPolicyController:return policyErp
WaveSortPolicyController->RPC:return policyErp
```

erp策略转tms策略

```sequence
title:/wms/waveSortPolicy/erp/{id}主要是将erp策略和ErpTradeDelivery关联起来保存到waveSortPolicyTms
RPC->WaveSortPolicyController:policyErp.id
WaveSortPolicyController->WavePolicyManager:transferDeliveriesToTms
WavePolicyManager->waveSortPolicyTmsRepository:save
waveSortPolicyTmsRepository->WavePolicyManager:retrun waveSortPolicyTms
WavePolicyManager->WaveSortPolicyController:retrun waveSortPolicyTms
WaveSortPolicyController->RPC:retrun waveSortPolicyTms

```

tms策略转station策略

```sequence
title:wms/waveSortPolicy/station/assign
RPC->WaveSortPolicyController:policyErp.waveSortNum
WaveSortPolicyController->WavePolicyManager:assignPolicyToStation
WavePolicyManager->waveSortPolicyTmsRepository:getTmsPolicyByWaveSortNum
waveSortPolicyTmsRepository->WavePolicyManager:waveSortPolicyTmsList
WavePolicyManager->WavePolicyManager:generateWaveSortPolicyStation
WavePolicyManager->waveSortPolicyStationRepository:save
```

生成装箱策略

```sequence
RPC->WaveSortPolicyController:policyErp.waveSortNum
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx
RPC->WaveSortPolicyController:xxxxxxxxxxxxxxxx

```



```
waveSortPolicyTms继承waveSortPolicyStation
谁生成tms策略？
assignPolicyToStation
```







中间好像有少记录

![1568802121240](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1568802121240.png)

少生成了StationPolicy

![1568802219000](C:\Users\Administrator\AppData\Roaming\Typora\typora-user-images\1568802219000.png)

```java
import com.github.xjtushilei.core.Spider;
import com.github.xjtushilei.core.pageprocesser.PageProcessor;
import com.github.xjtushilei.core.saver.Saver;
import com.github.xjtushilei.model.Page;
import org.jsoup.nodes.Document;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class SimpleSpider {

    //爬取《交大新闻网》的所有信息，并将信息输出到文本文件！

    public static void main(String[] args) {
        Spider.build()
                .setProcessor(myPageProcessor)
                .setSaver(mySaver)
                .addUrlSeed("http://news.xjtu.edu.cn")
                .addRegexRule("http://news.xjtu.edu.cn/.*htm") //只爬取新闻类的页面
                .run();
    }


    /**
     * 实现自己逻辑的页面解析功能！
     * <p>
     * 这里是在一个文件里实现的，若果你的功能比较多，完全可以用新的class文件来生成，并在上面set即可！
     */
    static PageProcessor myPageProcessor = new PageProcessor() {

        @Override
        public Page process(Page page) {

            //如果不匹配，则不进行解析！
            if (!Pattern.matches("http://news.xjtu.edu.cn/info/.*htm", page.getUrlSeed().getUrl())) {
                return page;
            }

            Document htmldoc = page.getDocument();
            //select返回的是一个数组，所以需要first，相关语法请google“jsoup select语法”和“cssquery”
            try {
                String title = htmldoc.select(".d_title").first().text();
                String text = htmldoc.select(".d_detail").first().text();

                //用来存放爬取到的信息，供之后存储！map类型的即可，可以自定义各种嵌套！
                Map<String, String> items = new HashMap<String, String>();
                items.put("title", title);
                items.put("text", text);
                items.put("url", page.getUrlSeed().getUrl());

                //放入items中，之后会自动保存（如果你自己实现了下载器，请自己操作它。如下我自定义了自己的下载器，并将它保存到了文本中！）！
                page.setItems(items);
            } catch (NullPointerException e) {
                System.out.println("没有解析到相关东西！跳过");
            }


            return page;
        }

        /**
         * 推荐在这里做优先级处理的东西。或者您可以做任何其他的事情。关于优先级的使用，我们在接下来的“优先级Spider”中会讲解
         */
        @Override
        public Page processNewUrlSeeds(Page page) {
            return page;
        }
    };

    /**
     * 实现自己的保存器！可以将爬取到的结果放入到mongodb，mysql等等中！这里保存到<当前用户>的“ScriptSpider”目录下。
     * <p>
     * 这里是在一个文件里实现的，若果你的功能比较多，完全可以用新的class文件来生成，并在上面set即可！
     *
     * 提醒：运行结束会产生大量的文件！建议运行几秒即可！
     */
    static Saver mySaver = new Saver() {

        @Override
        public Page save(Page page) {
            //结果不为空就存储！
            if (page.getItems().size() != 0) {
                try {
                    String fileRoot = System.getProperty("user.home") + "/ScriptSpider/";
                    File file = new File(fileRoot + (new Date().getTime()) + ".txt");
                    File fileParent = file.getParentFile();
                    if (!fileParent.exists()) {
                        fileParent.mkdirs();
                    }
                    file.createNewFile();
                    FileWriter fileWriter = new FileWriter(file);
                    page.getItems().forEach((key, value) -> {
                        try {
                            fileWriter.append(key.toString() + "\n").append(value.toString() + "\n");
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    });
                    fileWriter.flush();
                    fileWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
            return page;
        }
    };
}
```

