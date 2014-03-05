# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

show_gadio = Show.create(
  name: 'Gadio',
  desc: '国内首家游戏网络电台，最新最全的游戏新闻。热门游戏报道，游戏心得分享，以及业内最专业的游戏人访谈。涵盖所有游戏主机，由糖蒜广播大力支持。',
  content: '<p>Gadio content here</p>'
)
show_gadio.volumes.create(
  title: '一切都变了！',
  no: 115,
  desc: '首期年份编号2014的节目，好感动！第4个年头的开始啊！新闻：基本没有 ，eshop 问题等等 专题：可曾自己想过10岁左右玩游戏的你和现在玩游戏都有哪些变化呢？无论是你自身还是游戏本身，一起来听听吧！',
  content: '<p>一切都变了！更加详细的介绍。',
  resource: 'http://c.tangsuanradio.com/gamecores/gadiovol115.mp3'
)
show_gadio.volumes.create(
  title: '玩儿进去了！',
  no: 117,
  desc: '新闻：MGS各平台对比画面 Irrational Games解散。专题：恐怖 射击 H 玩到兴奋时候你的反应是什么样的（身体上）？你有没有遇到过一些反应过激的奇葩基友？',
  content: '<p>玩儿进去了！更加详细的介绍。',
  resource: 'http://cdn.lizhi.fm/audio/2014/02/20/9647203344196998_hd.mp3'
)

show_1762 = Show.create(
  name: '一起来lu2次元',
  desc: '这里是糖蒜广播和机核网联合打造的国内首家动漫类播客、GADIO的姊妹电台：二次元で一绪に话せ！',
  content: '<p>一起来lu2次元 content here</p>'
)
show_1762.volumes.create(
  title: '拆散这对狗男女',
  no: 26,
  desc: '小伙伴们情人节过的开心么？汉子/妹子约会了么？如果成功了那就恭喜啦~~~如果不开心，没关系！本期话题充满恶意:拆散你们这该死的对"狗男女"，让我们说一下动漫里那些让你极其不爽的CP吧～',
  content: '<p>拆散这对狗男女更加详细的介绍。',
  resource: 'http://cdn.lizhi.fm/audio/2014/02/19/9615738413796998_hd.mp3'
)
show_1762.volumes.create(
  title: '2013年末报告！',
  no: 22,
  desc: '2013年即将过去了！这一整年中有那些你喜爱和另你感动的动画呢？ 本期几位主播将逐个说出他们心中的年度动画top3，以及看了以后感到失望的动画！ 年度大总结，不要错过喔！让我们带着满满的回忆和感动迎接新的一年吧！',
  content: '<p>2013年末报告！更加详细的介绍。',
  resource: 'http://c.tangsuanradio.com/gamecores/AVGvol22.mp3'
)

card_type = CardType.create(
  name: '当家主播',
  desc: '机核团队的主播们。'
)
card_type.cards.create(
  title: '西蒙',
  desc: '机核网创始人之一 GADIO主持人 插画设计师 KAPPA设计师 赵夏 ',
  content: '<p>西蒙的详细信息</p>'
)
card_type.cards.create(
  title: '在日本做游戏的日子',
  desc: '株式会社BANZAI Entertainment CEO；原SQUARE ENIX（TOKYO）1st Production &amp;Visual Works设计师 ',
  content: '<p>在日本做游戏的日子的详细信息</p>'
)