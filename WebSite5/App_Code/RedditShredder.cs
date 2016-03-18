using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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
            try {
                reader.LoadXml("<content>"+post.PostContent + "</content>"); }
            catch(Exception e)
            {

            }
            string innerxml = reader.InnerXml;
            string[] imageArray = innerxml.Split(new string[] { "<img" }, StringSplitOptions.None);
            if (imageArray.Length > 1)
            {
                string image = imageArray[1];
                image = image.Split('>')[0];
                image = "<img" + image + ">";
                post.Image = image;
            }
            else
            {
                post.Image = "";
            }

            var yearReg = "(20[0-9][0-9]|20[0-9][0-9])";            //< Allows a number between 2014 and 2029
            var monthReg = "(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)";               //< Allows a number between 00 and 12
            var dayReg = "([1-9]|0[1-9]|1[0-9]|2[0-9]|3[0-1])";   //< Allows a number between 00 and 31
            var hourReg = "([0-1][0-9]|2[0-4])";            //< Allows a number between 00 and 24
            var minReg = "([0-5][0-9])";                    //< Allows a number between 00 and 59
            var reg = new Regex(yearReg+"-"+ dayReg + "-" + dayReg + "T" + hourReg + ':' + minReg + ':' + minReg);
            if (reader.SelectSingleNode("//updated") != null)
            {
                string tempss = reader.SelectSingleNode("//updated").InnerText;
                string date = reader.SelectSingleNode("//updated").InnerText;
                string output = reg.Match(date).ToString();
                DateTime time = new DateTime();
                try
                {
                    time = DateTime.Parse(output);

                }
                catch
                {
                    reg = new Regex(dayReg + "\\s" + monthReg + "\\s" + yearReg);
                    output = reg.Match(output).ToString();
                    time = DateTime.Parse(output);
                }

                post.PostDate = time;
            }
            posts.Add(post);
        }
    }
}