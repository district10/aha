Aha -- Ansi HTML Adapter
========================

简化了 [theZiz/aha](https://github.com/theZiz/aha)，使得只输出 HTML 片段。

> 注：
>
> 后来发现他原来的 `--no--header` 就可以实现。
> 但我还要设置 css，所以加了 class。

一个例子
--------

源文件 `_a.txt`:

```plain
What do you mean?（这行被删除）
When you nod your head yes（单词改变）
But you wanna say no（单词添加）
What do you mean?（删除单词）
When you don't want me to move（这行不变）
```
    
源文件 `_b.txt`:

```plain
When you nod your haydes（单词改变）
But you wanna say me no（单词添加）
What you mean?（删除单词）
When you don't want me to move（这行不变）
But you tell me to go（这行新添加）
```

脚本 `gen.sh`：

```bash
git diff --color-words --no-index _a.txt _b.txt | aha > diffed.md
```

输出 `diffed.md`:

```html
<pre class="diffed">
<span style="font-weight:bold;">diff --git a/_a.txt b/_b.txt</span>
<span style="font-weight:bold;">index 0cb3b2a..d540f3f 100644</span>
<span style="font-weight:bold;">--- a/_a.txt</span>
<span style="font-weight:bold;">+++ b/_b.txt</span>
<span style="color:teal;">@@ -1,5 +1,5 @@</span>
<span style="color:red;">What do you mean?（这行被删除）</span>When you nod your <span style="color:red;">head yes（单词改变）</span><span style="color:green;">haydes（单词改变）</span>
But you wanna say <span style="color:green;">me</span> no（单词添加）
What<span style="color:red;">do</span> you mean?（删除单词）
When you don't want me to move（这行不变）
<span style="color:green;">But you tell me to go（这行新添加）</span>
</pre>
```

加点 CSS：

```css
pre {
    border: 1px dotted gray;
    background-color: #ececec;
    color: #1111111;
    padding: 0.5em;
    word-wrap: normal;
    word-break: break-all;
    white-space: pre;
    overflow: auto;
    margin-bottom: 10px;
    display: block;
}

pre.diffed {
    background-color: white;
    border: 1px dotted #f8bd0b;
    font-size: 90%;
    font-family: Consolas, Inpact, Arial, Hiragino, "Hiragino Sans GB", "Microsoft YaHei", "WenQuanYi Micro Hei", SimSun, STXihei, Heiti, sans-serif;
}
```

在我网站（[Pretty Diff | 听歌学英语](http://tangzx.qiniudn.com/post-0062-pretty-diff.html)）上的效果：

![[Pretty Diff | 听歌学英语](http://tangzx.qiniudn.com/post-0062-pretty-diff.html)](http://gnat.qiniudn.com/diffed/diffed.png)