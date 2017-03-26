# 花样校园项目逻辑及数据库说明  
## 一、项目逻辑  
### 1.vip有3个类型:  
* **普通用户**:可购买商品,浏览等,认证之后(*添加认证信息*)成为认证用户,可发布商品,修改商品信息等。  
* **管理员**:审核用户认证信息,审核商品发布与修改。  
* **超级管理员**:(唯一),指定某个用户(认证不认证都可以)为管理员。  
### 2.评论逻辑  
* 用户可以对某个商品进行评论,用户之间可回复评论。
* 用户完成订单后对发布人(店铺)进行评论,因为是二手街,不存在对商品评论,可以传照片。
### 3.审核认证  
* 用户经过认证后才能发布商品。
* 用户认证和发布商品需要经过管理员审核,驳回或通过。
* 超级管理员可以将普通vip提升为管理员。
* 项目审核后台也在此项目,合在一起。
## 二、数据库  
* 数据库sql文件有字段注释。
* 数据库的timestamp都是默认为null,若更新或创建记着new Date()
---
 ![图片](https://avatars1.githubusercontent.com/u/19592001?v=3&s=40)  
 [Markdown](http://blog.csdn.net/zhaokaiqiang1992/article/details/41349819)  
 