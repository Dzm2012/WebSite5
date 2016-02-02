using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public List<string> latin = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        List<RSSShreder> Feeds = new List<RSSShreder>();
        Feeds.Add(new RSSShreder(@"https://www.realwire.com/rss/?id=183&row=&view=Synopsis"));
        Feeds.Add(new RSSShreder(@"https://www.realwire.com/rss/?id=184&row=&view=Synopsis"));
        foreach (var Feed in Feeds)
        {
            foreach (var item in Feed.items)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append(" <h2>" + item.Title + "</h2> <br />");
                sb.Append(item.Description + "<br /><br />");
                sb.Append("<a href = \"" + item.Link + "\" >" + item.Link + "</a><br /><br />");
                latin.Add(sb.ToString());
            }
        }
    }
}