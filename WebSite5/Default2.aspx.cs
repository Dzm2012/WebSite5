using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    public List<RSSShreder> Feeds = new List<RSSShreder>();
    public List<FeedDeffinition> d = new List<FeedDeffinition>();
    public List<RedditShredder> rss = new List<RedditShredder>();
    public List<RedditPost> f = new List<RedditPost>();
    protected void Page_Load(object sender, EventArgs e)
    {
        Feeds.Add(new RSSShreder(@"https://www.realwire.com/rss/?id=183&row=&view=Synopsis", 0));
        Feeds.Add(new RSSShreder(@"https://www.realwire.com/rss/?id=184&row=&view=Synopsis", 0));
        Feeds.Add(new RSSShreder(@"http://feeds.feedburner.com/GamasutraNews", 0));
        Feeds.Add(new RSSShreder(@"http://us.blizzard.com/en-us/news/rss.xml", -3));
        Feeds.Add(new RSSShreder(@"http://feeds.ign.com/ign/all", -5));

        rss.Add(new RedditShredder(@"https://www.reddit.com/r/gaming/top/.rss"));
        rss.Add(new RedditShredder(@"https://www.reddit.com/r/wow/top/.rss"));
        rss.Add(new RedditShredder(@"https://www.reddit.com/r/darksouls/top/.rss"));

        d.Add(Feeds[0].items[0]);
        Feeds[0].items.Remove(Feeds[0].items[0]);
        foreach (var Feed in Feeds)
        {
            for (int i = 0; i < Feed.items.Count; i++)
            {
                for (int x = 0; x < d.Count; x++)
                {
                    if (Feed.items[i].PubDate > d[x].PubDate)
                    {
                        sort(x);
                        d[x] = Feed.items[i];
                        break;
                    }
                }
                if (!d.Contains(Feed.items[i]))
                    if (!checkItemDescription(Feed.items[i].Description))
                        d.Add(Feed.items[i]);


            }
        }

        foreach (var Feed in rss)
        {
            for (int i = 0; i < Feed.posts.Count; i++)
            {
                for (int x = 0; x < f.Count; x++)
                {
                    if (Feed.posts[i].PostDate > f[x].PostDate)
                    {
                        sortReddit(x);
                        f[x] = Feed.posts[i];
                        break;
                    }
                }
                if (!f.Contains(Feed.posts[i]))
                    if (!checkItemDescription(Feed.posts[i].PostContent))
                        f.Add(Feed.posts[i]);


            }
        }
    }
    public void sort(int startIndex)
    {
        d.Add(new FeedDeffinition());
        for (int i = d.Count - 2; i > startIndex; i--)
        {
            d[i + 1] = d[i];
        }
    }

    public void sortReddit(int startIndex)
    {
        f.Add(new RedditPost());
        for (int i = f.Count - 2; i > startIndex; i--)
        {
            f[i + 1] = f[i];
        }
    }

    public bool checkItemDescription(string description)
    {
        foreach (var item in d)
        {
            if (item.Description.Equals(description))
                return true;
        }
        return false;
    }
}