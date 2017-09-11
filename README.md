# InternationalizationDemo
iOS项目国际化最便利的Demo
最近刚接手了一个直播的项目，但是面向的用户人群是境外华侨和各国人士，整个项目本身就很大。很无奈，但是还得弄啊。怎么办？我就用了一天将完整的整个项目实现了国际化。基础的我就不讲了，想了解的看[《iOS之应用程序国际化》](http://www.jianshu.com/p/63a1c1a40b93)、[《iOS国际化开发》](https://www.xiaolei0808.com/2016/04/24/Localized-iOS/)。下面开始讲讲我的方法：
- **工具**
由于也是第一次接触到国际化，抱着向前辈学习思想（`其实我就是想偷懒`),找到了~~[这个工具](https://github.com/ashen-zhao/ReadChinese)~~，这个可以支持中文和繁体文导出，用它首先你整个项目中的中文都能获取到了，我fork了这个项目并且在此项目的基础上修改了一下正则表达式，添加了支持xib,storyBoard,swift文件的支持,大家可以用这个[国际化导出中文工具](https://github.com/rongshuizhou/ReadChinese)。
- **Demo效果**

![录制的](http://upload-images.jianshu.io/upload_images/856856-3dddb46b9458e8ff.gif?imageMogr2/auto-orient/strip)


我的简书地址[项目国际化](http://www.jianshu.com/p/542816df0a58)
