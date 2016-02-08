<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID="header" runat="server">
<div class="redditContent">
    <% 
        foreach (var post in rss)
        {
            foreach (var item in post.posts)
            {
                string html = "";

                html += "<div style=\"width:70%; height:250px; margin:auto;\">";
                html += "<div style=\"width:70%; height:250px; background-color:azure; border-radius: 25px; margin:auto;\">";
                html += "<div style=\"width:100%;margin-right:5%; height:250px;\">";
                html += "<span style=\"margin-left:5%;\">"+item.PostTitle+"</span><br />";
                html += "<span style=\"margin-left:5%;\">"+item.PostContent+"</span><br />";
                html += "<span style=\"text-align:right;\"> - "+item.AuthorName+"</span>";
                html += "</div>";
                html += "</div>";
                html += "</div>";

                Response.Write(html);
            }
        }

        %>
    
  </div>

  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="slick-1.5.9/slick/slick.min.js"></script>

    

  <script type="text/javascript">
        $(document).ready(function(){
            $('.redditContent').slick({
                autoplay: true,
                slidesToShow: 3,
                slidesToScroll: 1
            });
        });
    </script>

    

</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    

    

    <%
        bool side = false;

        foreach (var item in d)
        {
            {
                string html = "";
                if (side)
                {
                    html = "<br />" +
                    "<div style=\"position: relative; overflow:auto; border-radius: 25px; border:medium; border-color:black; width:85%; min-height:200px; background-color:azure; margin-left:2%;\">" +
                    //"<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\" style=\"margin-left:1%; margin-right:5%; margin-top:1%;\"></span>" +
                    "<br />";

                    html += "<div style=\" font-size:14px; margin-left:5%; margin-right:5%;\">" +
                    "<b>" +
                    "<h4>" + item.PubDate + "</h4><h2>" + item.Title + "</h2> <br />";
                    if (item.Image != "")
                        html += "<div style=\"float:right; margin-bottom:2%;\">"+item.Image+"</div>";
                    html += "<div>";
                    if (item.Image != null)
                        html += "<br /><br /><br />";
                    html += item.Description + "</div>";

                    html += "<br /><br />" +
                    "<a href = \"" + item.Link + "\" >Click Here to Read More...</a><br /><br />" +
                    "</b>" +
                    "</div>" +
                "</div>";

                    side = false;
                }
                else
                {
                    html = "<br />" +
                    "<div style=\"overflow:auto; border-radius: 25px; border:medium; border-color:black; width:85%; min-height:200px; background-color:azure; margin-left:auto; margin-right:2%;\" align=\"right\">" +
                    //"<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\" style=\"margin-left:5%; margin-right:1%; margin-top:1%;\"></span>" +
                    "<br />";

                    html += "<div style=\" font-size:14px; margin-left:5%; margin-right:5%; margin-bottom:2%;\">" +
                    "<b>" +
                    "<h4>" + item.PubDate + "</h4><h2>" + item.Title + "</h2>";
                    if (item.Image != "")
                        html += "<div style=\"margin-bottom:2%;\">"+item.Image+"</div>";
                    html += "<div>";
                    if (item.Image != null)
                        html += "<br /><br /><br />";
                    html += item.Description + "</div>";

                    html += "<br /><br />" +
                    "<a href = \"" + item.Link + "\" >Click Here to Read More...</a><br /><br />" +
                    "</b>" +
                    "</div>" +
                "</div>";
                    side = true;
                }
                Response.Write(html);
            }
        }

    %>
</asp:Content>
