using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public List<RSSShreder> Feeds = new List<RSSShreder>();
    public List<FeedDeffinition> d = new List<FeedDeffinition>();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Feeds.Add(new RSSShreder(@"https://www.realwire.com/rss/?id=183&row=&view=Synopsis"));
        Feeds.Add(new RSSShreder(@"https://www.realwire.com/rss/?id=184&row=&view=Synopsis"));
        Feeds.Add(new RSSShreder(@"http://feeds.feedburner.com/GamasutraNews"));
        
        d.Add(Feeds[0].items[0]);
        Feeds[0].items.Remove(Feeds[0].items[0]);
        foreach (var Feed in Feeds)
        {
            for(int i =0;i< Feed.items.Count;i++)
            {
                for (int x = 0; x < d.Count; x++)
                {
                    if(Feed.items[i].PubDate>d[x].PubDate)
                    {
                        sort(x);
                        d[x] = Feed.items[i];
                        break;
                    }
                }
                if (!d.Contains(Feed.items[i]))
                    d.Add(Feed.items[i]);
            }
        }
    }
    public void sort(int startIndex)
    {
        d.Add(new FeedDeffinition());
        for (int i= d.Count-2; i> startIndex; i--)
        {
            d[i + 1] = d[i];
        }
    }
}