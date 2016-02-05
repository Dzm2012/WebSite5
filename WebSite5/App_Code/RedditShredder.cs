using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for RedditShredder
/// </summary>
public class RedditShredder
{
    public List<RedditPost> posts = new List<RedditPost>();
    public RedditShredder(string url)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(url);
        XmlDocument docc = new XmlDocument();
        string deoc = doc.InnerXml.Remove(0,38);
        docc.LoadXml(deoc);
        XmlNodeList nodes = docc.FirstChild.ChildNodes;
        
        foreach (XmlNode node in nodes)
        {
            string builder = "";
            
                if (!node.Name.Equals("entry"))
                continue;
            foreach (var temp in node.InnerXml.Split(new string[] { "xmlns=\"http://www.w3.org/2005/Atom\"" }, StringSplitOptions.RemoveEmptyEntries))
                builder += temp;
            XmlDocument reader = new XmlDocument();
            RedditPost post = new RedditPost();

            reader.LoadXml("<root>" + builder + "</root>");

            post.PostTitle = reader.SelectSingleNode("//title").InnerText;
            post.PostUrl = reader.SelectSingleNode("//link/@href").InnerText;
            post.AuthorName = reader.SelectSingleNode("//author/name").InnerText;
            post.AuthorUrl = reader.SelectSingleNode("//author/uri").InnerText;
            post.PostContent = reader.SelectSingleNode("//content").InnerText;
            posts.Add(post);
        }
    }
}