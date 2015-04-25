module JavascriptHelper

  def disqus_comments(article)
    <<-JS.html_safe if Rails.env == 'production'
      <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES * * */
        var disqus_shortname = 'vizvamitra';
        var disqus_identifier = 'article_#{article.id}';
        var disqus_title = '#{article.title.gsub('\'', '\\\'')}';
        var disqus_url = '#{article_url(article)}';
        var disqus_config = function () { 
          this.language = "ru";
        };
        
        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
      </script>
      <noscript>
        Please enable JavaScript to view the
        <a href='https://disqus.com/?ref_noscript' rel='nofollow'>comments powered by Disqus.</a>
      </noscript>
    JS
  end

  def disqus_comment_counter
    <<-JS.html_safe if Rails.env == 'production'
      <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES * * */
        var disqus_shortname = 'vizvamitra';
        
        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function () {
            var s = document.createElement('script'); s.async = true;
            s.type = 'text/javascript';
            s.src = '//' + disqus_shortname + '.disqus.com/count.js';
            (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
        }());
      </script>
    JS
  end

end