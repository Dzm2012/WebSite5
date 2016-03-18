<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>
<link href="BootStrap/bootstrap.css" rel="stylesheet" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body  style="background-color:#B9B1A8; font-family:'Open Sans', sans-serif;">
    <br />
    <span class="row"></span>
    <form id="form1" runat="server">
        <%
            Random color = new Random(DateTime.Now.Millisecond);
            Random width = new Random(DateTime.Now.Millisecond);
            int wid = 12;
            List<string> colors = new List<string>() {"#D0CABF","#DE8642","#4B4D52" };
            List<string> textColors = new List<string>() {"black","black","antiquewhite" };

            int redditCounter = 0;
            int rssCounter = 0;


            try {
                for (int i = 0; i < f.Count; i++)
                {
                    int colorID = color.Next(0, 3);
                    int widthTemp = width.Next(wid / 6, wid / 2);
                    if (widthTemp < 3)
                        widthTemp += 2;
                    if (widthTemp > 8)
                        widthTemp -= 2;
                    wid -= widthTemp;
                    string content = "";
                    if(widthTemp>=4)
                    {
                        var temp = d[rssCounter];
                        content = "<div  style=\"margin-left:10px; margin-right:10px;\">"+temp.Description.Trim()+"</div></span>";
                        rssCounter++;
                    }
                    else
                    {//text-align: center;
                        var temp = f[redditCounter];
                        while(temp.Image.Trim() == "")
                        {
                            redditCounter++;
                            temp = f[redditCounter];
                        }
                        content = "<div  style=\"margin-left:10px; margin-right:10px;text-align: center;\">";
                        content+= "<div style\"display: table-cell; vertical-align: middle; text-align: center;\">" +temp.Image+"</div></div></span>";
                        redditCounter++;
                    }

                    string html = "<div class=\"row\">";
                    html += "<div class=\"col-lg-" + widthTemp + "\">";
                    html += "<div class=\"scroll\" style=\"width:100%; background-color:" + colors[colorID] + "; border-radius:25px; margin-bottom:30px;\">";
                    html += "<span style=\"margin-left:10px; vertical-align:middle; color:" + textColors[colorID] + ";\">";
                    html += content;
                    html += "<br />";
                    html += "<br />";
                    html += "</div>";
                    html += "</div>";
                    colors.Remove(colors[colorID]);
                    textColors.Remove(textColors[colorID]);
                    colorID = color.Next(0, colors.Count);
                    widthTemp = width.Next(wid / 6, wid / 2);
                    if (widthTemp == 1)
                        widthTemp += 2;
                    if (widthTemp > 8)
                        widthTemp -= 2;
                    wid -= widthTemp;

                    html += "<div class=\"col-lg-" + widthTemp + "\">";

                    if(widthTemp>=4)
                    {
                        var temp = d[rssCounter];
                        content = "<div  style=\"margin-left:10px; margin-right:10px;\">"+temp.Description.Trim()+"</div></span>";
                        rssCounter++;
                    }
                    else
                    {
                        var temp = f[redditCounter];
                        while(temp.Image.Trim() == "")
                        {
                            redditCounter++;
                            temp = f[redditCounter];
                        }
                        content = "<div  style=\"margin-left:10px; margin-right:10px;text-align: center;\">";
                        content+= "<div style\"display: table-cell; vertical-align: middle; text-align: center;\">" +temp.Image+"</div></div></span>";
                        redditCounter++;
                    }

                    html += "<div class=\"scroll\" style=\"width:100%; background-color:" + colors[colorID] + "; border-radius:25px; margin-bottom:30px;\">";
                    html += "<span style=\"margin-left:10px; vertical-align:middle; color:" + textColors[colorID] + ";\">";
                    html += content;
                    html += "<br />";
                    html += "<br />";
                    html += "</div>";
                    html += "</div>";
                    html += "<div class=\"col-lg-" + wid + "\">";
                    colors.Remove(colors[colorID]);
                    textColors.Remove(textColors[colorID]);

                    if(wid>=4)
                    {
                        var temp = d[rssCounter];
                        content = "<div  style=\"margin-left:10px; margin-right:10px;\">"+temp.Description.Trim()+"</div></span>";
                        rssCounter++;
                    }
                    else
                    {
                        var temp = f[redditCounter];
                        while(temp.Image.Trim() == "")
                        {
                            redditCounter++;
                            temp = f[redditCounter];
                        }
                        content = "<div  style=\"margin-left:10px; margin-right:10px;text-align: center;\">";
                        content+= "<div style\"display: table-cell; vertical-align: middle; text-align: center;\">" +temp.Image+"</div></div></span>";
                        redditCounter++;
                    }

                    html += "<div class=\"scroll\" style=\"width:100%; background-color:" + colors[0] + "; border-radius:25px; margin-bottom:30px;\">";
                    html += "<span style=\"margin-left:10px; vertical-align:middle; color:" + textColors[0] + ";\">";
                    html += "<div  style=\"margin-left:10px; margin-right:10px;\">"+content.Trim()+"</div></span>";
                    html += "<br />";
                    html += "<br />";
                    html += "</div>";
                    html += "</div>";
                    html += "</div>";
                    //html += "<br />";
                    //html += "<br />";
                    //html += "<br />";
                    Response.Write(html);
                    wid = 12;
                    colors = new List<string>() { "#D0CABF", "#DE8642", "#4B4D52" };
                    textColors = new List<string>() { "black", "black", "antiquewhite" };
                } }
            catch(Exception e)
            {
                int r = redditCounter;
                int t = rssCounter;
            }
        %>
       <%-- <div class="col-lg-3">
            <div class="scroll" style="width:100%; background-color:#D0CABF; border-radius:25px;">
                <span style="margin-left:10px;">Sample Text</span>
                <br />
                <br />
            </div>
        </div>
        <div class="col-lg-3">
            <div class="scroll" style="width:100%; background-color:#DE8642; border-radius:25px;">
                <span style="margin-left:10px;">Sample Text</span>
                <br />
                <br />
            </div>
        </div>
        <div class="col-lg-6">
            <div class="scroll" style="width:100%; background-color:#4B4D52; border-radius:25px;">
                <span style="margin-left:10px; color:antiquewhite;">Sample Text</span>
                <br />
                <br />
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="col-lg-5">
            <div class="scroll" style="width:100%; background-color:#DE8642; border-radius:25px;">
                <br />
                <br />
            </div>
        </div>
        <div class="col-lg-4">
            <div class="scroll" style="width:100%; background-color:#D0CABF; border-radius:25px;">
                <br />
                <br />
            </div>
        </div>
        <div class="col-lg-3">
            <div class="scroll" style="width:100%; background-color:#4B4D52; border-radius:25px;">
                <br />
                <br />
            </div>
        </div>--%>
        
    </form>
</body>
</html>
<script>
    window.onscroll = testScroll;
    function testScroll(ev) {
        var x = document.getElementsByClassName("scroll");
        for (var i = 0; i < x.length; i++) {
            if(isScrolledIntoView(x[i])){

            }
            else {
                x[i].setAttribute('style','color:red;');
            }
        }
    }

    function isScrolledIntoView(elem) {
        var $elem = elem;
        var $window = window;

        var docViewTop = 0;
        var docViewBottom = docViewTop + window.height();

        var elemTop = $elem.offset().top;
        var elemBottom = elemTop + $elem.height();

        return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
    }
</script>
