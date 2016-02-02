using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for RSSShreder
/// </summary>
public class RSSShreder
{
    public List<FeedDeffinition> items = new List<FeedDeffinition>();
    public RSSShreder(string rssfeedUrl)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(rssfeedUrl);
        XmlNodeList nodes = doc.SelectNodes(@"//item");
        foreach(XmlNode node in nodes)
        {
            XmlDocument reader = new XmlDocument();
            FeedDeffinition feed = new FeedDeffinition();

            reader.LoadXml("<root>" + node.InnerXml + "</root>");

            feed.Title = reader.SelectSingleNode("//title").InnerText;
            feed.Link = reader.SelectSingleNode("//link").InnerText;
            feed.Description = reader.SelectSingleNode("//description").InnerText;
            items.Add(feed);
        }
    }
}