<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>


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
                    "<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\" style=\"margin-left:1%; margin-right:5%; margin-top:1%;\"></span>" +
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
                    "<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\" style=\"margin-left:5%; margin-right:1%; margin-top:1%;\"></span>" +
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
