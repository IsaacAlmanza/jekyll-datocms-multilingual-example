require "i18n/backend/fallbacks"

directory "_posts" do
   I18n.available_locales.each do |locale| # iterate over all the administrative area languages
     I18n.with_locale(locale) do    # switch to the nth locale
      dato.posts.each do |post|
        create_post "#{post.date.to_s.parameterize}-#{post.title.parameterize}.md" do
          frontmatter :yaml, {
            layout: "post",
            ref: post.ref,
            title: post.title,
            date: post.date.to_s,
            categories: post.categories,
            lang: "#{locale}",
          }
          content post.content
        end
      end
    end
  end
end #_post

# home_page
I18n.available_locales.each do |locale| # iterate over all the administrative area languages
  I18n.with_locale(locale) do    # switch to the nth locale
      create_post "index-#{locale}.md" do
        frontmatter :yaml, {
          layout: 'default',
          lang: "#{locale}",
          ref: "index",
          permalink: dato.home_page.permalink
        }
        content dato.home_page.content
      end
  end
end

# about_page
I18n.available_locales.each do |locale| # iterate over all the administrative area languages
  I18n.with_locale(locale) do    # switch to the nth locale
      create_post "about-#{locale}.md" do
        frontmatter :yaml, {
          layout: 'page',
          title: dato.about_page.title,
          ref: 'about',
          lang: "#{locale}",
          permalink: dato.about_page.permalink
        }
        content dato.about_page.bio
      end
  end
end
