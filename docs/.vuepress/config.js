module.exports = {
    title: "受信不能電波局-Monologuestation-",
    themeConfig: {
      description: "受信不能電波局-Monologuestation-",
      nav: [
        { text: "🏠Home", link: "/index2/" },
        { text: "📖Literary", link: "/Literary/literary_index.html" },
        { text: "🖍Doodling", link: "/Doodling/doodling_index.html" },
        { text: "🐤twitter", link: "https://twitter.com/y_mikou" },
        { text: "🙇応援お願いします", link: "https://fantia.jp/fanclubs/7222" },
        { text: "🎨pixiv", link: "https://www.pixiv.net/users/101579" } 
      ],
      sidebar: 'auto',
      plugins: [
        ['@vuepress/back-to-top'],
        ['@vuepress/last-updated'],
        [
          '@vuepress/google-analytics',
          {
            ga: 'G-XRTRYVLBCB', // 自身のトラッキングIDを設定
          },
        ]
      ]
    }
  };