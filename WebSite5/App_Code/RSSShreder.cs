using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Xml;

/// <summary>
/// Summary description for RSSShreder
/// </summary>
public class RSSShreder
{
    public List<FeedDeffinition> items = new List<FeedDeffinition>();
    public RSSShreder(string rssfeedUrl, int timeOffSet)
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
            
            var yearReg = "(20[0-9][0-9]|20[0-9][0-9])";            //< Allows a number between 2014 and 2029
            var monthReg = "(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)";               //< Allows a number between 00 and 12
            var dayReg = "([1-9]|0[1-9]|1[0-9]|2[0-9]|3[0-1])";   //< Allows a number between 00 and 31
            var hourReg = "([0-1][0-9]|2[0-4])";            //< Allows a number between 00 and 24
            var minReg = "([0-5][0-9])";                    //< Allows a number between 00 and 59
            var reg = new Regex(dayReg+"\\s"+monthReg+ "\\s" + yearReg+ "\\s" + hourReg + ':' +minReg + ':'+minReg);
            string date = reader.SelectSingleNode("//pubDate").InnerText;
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
            time=time.Add(new TimeSpan(timeOffSet, 0,0));
            feed.PubDate = time;

            string descriptionText = reader.SelectSingleNode("//description").InnerText;
            if (descriptionText.Contains("img src="))
            {
                descriptionText = descriptionText.Replace("&lt;", "<");
                descriptionText = descriptionText.Replace("&gt;", ">");
                feed.Image = "<img style=\"min-width: 200px; max-width: 500px; height: auto;\"" + descriptionText.Split(new string[] { "<img" }, StringSplitOptions.None)[1].Split(new string[] { ">" }, StringSplitOptions.None)[0]+">";
                bool remove = false;
                for(int i =0;i< descriptionText.Length;i++)
                {
                    if(descriptionText[i]=='<'&& descriptionText[i+1] == 'i'&& descriptionText[i+2] == 'm' && descriptionText[i+3] == 'g')
                    {
                        remove = true;
                        descriptionText = descriptionText.Remove(i, 1);
                        while(remove)
                        {
                            if (descriptionText[i] == '>')
                                remove = false;
                            descriptionText = descriptionText.Remove(i, 1);
                        }
                    }
                }
            }

            feed.Description = descriptionText;
            items.Add(feed);
        }
    }
}