module AnonymousPageTags
  include Radiant::Taggable

  desc %{
    Renders the contained elements if the current contextual page has the page type Anonymous.

    This is typically used inside another tag (like &lt;r:children:each&gt;) to add conditional mark-up if the child element is of the page type Anonymous.

    *Usage:*
    
    <pre><code><r:if_anonymous>...</r:if_anonymous></code></pre>
  }
  tag "if_anonymous" do |tag|
    tag.expand if tag.locals.page.class_name == "AnonymousPage"
  end
  
  desc %{
    Renders the contained elements unless the current contextual page has the page type Anonymous.

    This is typically used inside another tag (like &lt;r:children:each&gt;) to add conditional mark-up unless the child element is of the page type Anonymous.

    *Usage:*

    <pre><code><r:unless_anonymous>...</r:unless_anonymous></code></pre>
  }
  tag "unless_anonymous" do |tag|
    tag.expand unless tag.locals.page.class_name == "AnonymousPage"
  end

end