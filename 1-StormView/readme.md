## FileManager

* FileManager对象可以查看和更改文件系统的内容，可以访问大多数共享文件管理器对象。可以创建复制移动文件和目录

* 可以通过path和NSUrl来定位

  ```swift
  class var `default`: FileManager{get}
  ```

* default 返回一个FileManager对象

* `contentsOfDirectory(atPath:)`

  * 只返回一个NSString数组，包含路径下的文件，目录以及符号链接的名称
  * 只进行浅层搜索，只搜索名称，比对子目录或文件内容进行访问
  * 该方法返回一个非可选值，并用throw关键字标记，来表明可以抛出异常，可以用try来处理

# Bundle

* 代表应用代码所存放的包
* ` Boundle.main`当前执行文件的包

# unwrap

* ! 当可选值变量已经赋值，即可选值变量必不为nil，可以使用`!`强制解包。
* 隐式解析可选类型

```swift
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // 需要感叹号来获取值

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString  // 不需要感叹号
```



# navigationcontroller

`navigationcontroller?.hidebarOnTap`默认设置所有的title为large

推荐在主界面或者主要界面设置，等级较低的界面应设置常规大小的title

# nil coalescing operator

```swift
override func prefersHomeIndicatorAutoHidden() -> Bool {
    return navigationController?.hidesBarsOnTap ?? false
}
```

如果navigationController为nil，那么不进行后续操作直接返回false