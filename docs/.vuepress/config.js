import commentBox from 'commentbox.io';
module.exports = {
    title: "MonologueStation",
    themeConfig: {
      description: "MonologueStation",
      nav: [
        { text: "🏠Home", link: "/" },
        { text: "📖Literary", link: "/Literary/literary_index.html" },
        { text: "🖍Doodling", link: "/Doodling/doodling_index.html" },
        { text: "🐤twitter", link: "https://twitter.com/y_mikou" },
        { text: "🙇応援お願いします", link: "https://fantia.jp/fanclubs/7222" },
        { text: "🎨pixiv", link: "https://www.pixiv.net/users/101579" } 
      ],
      sidebar: 'auto'
    }
    ['script', { src: 'https://unpkg.com/commentbox.io/dist/commentBox.min.js' }]
  };
  commentBox('5713318824116224-proj');