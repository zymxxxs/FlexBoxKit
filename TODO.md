* flex 属性
    * yoga 提供了 flex 属性，yogakit 并没有暴露，这个属性是否需要 flexboxkit 实现？？
* margin、padding、border 是否需要实现 `20 20 12 30` 的能力？
    * 需要考虑

* xml 解析 -> model -> layout
    * 该流程的方法命名、实现、分层需要从新考虑

* FBKRootView 是否本身需要一个 contentView 或者 containerView 来加载 xml 中的布局？
    - contentView 或者 containerView 在操作上会比较好、对于识图的操作可以统一来处理，不需要遍历
    - 书写 xml 的时候，本身就已经需要一个 rootEle，rootEle的边界是什么？
        - 对应 contentView, containerView?
        - contentView 或者 containerView 的 subview？

* 整体架构的考虑（重要！！！）
* 原生控件（待考虑）·
* cache 层 --- 用于加快 xml 的读取速度（淘汰算法）
* xml server 用于渲染当前UI（模拟器+真机） --- 相关UI、相关逻辑
* debug 模式 --- 用于显示当前 xml 内容、输出 xml 中不合法内容
* `xml server` 和 `加载本地 xml` 在接口设计和使用要友好且方便
* FBKSetYogaLayoutParam 中需要考虑优化下、·
