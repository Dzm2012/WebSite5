<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:right"></div>
    <%
        bool side = false;
        
        foreach (var item in d)
        {
            {
                string html = "";
                if (side)
                {
                    html = "<br />" +
        "<div style=\"border-radius: 25px; border:medium; border-color:black; width:85%; min-height:200px; background-color:azure; margin-left:2%;\">" +
                    "<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\" style=\"margin-left:1%; margin-right:5%; margin-top:1%;\"></span>" +
                    "<br />";
                    
                    html += "<div><div style=\"font-size:14px; margin-left:5%; margin-right:25%;\">" +
                    "<b>" +
                    "<h4>"+item.PubDate+"</h4><h2>" + item.Title + "</h2> <br />" +
                    item.Description;
                    html +="</div>";
                    if (item.Image != "")
                        html += "<div style=\"margin-right:5%; text-align:right;\">"+item.Image+"</div>";
                    html += "<br /><br />" +
                        "<a style=\"margin-left:5%;\" href = \"" + item.Link + "\" >" + item.Link + "</a><br /><br />" +
                        "</b>";
                            
                        html +="</div>";
                        
                        html +="</div>";
                    
                    side = false;
                }
                else
                {
                    html = "<br />" +
        "<div style=\"border-radius: 25px; border:medium; border-color:black; width:85%; min-height:200px; background-color:azure; margin-left:auto; margin-right:2%;\" align=\"right\">" +
                    "<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\" style=\"margin-left:5%; margin-right:1%; margin-top:1%;\"></span>" +
                    "<br />";
                    if (item.Image != "")
                        html += "<div>"+item.Image+"</div>";
                    html += "<div style=\"font-size:14px; margin-left:5%; margin-right:5%;\">" +
                    "<b>" +
                    "<h4>"+item.PubDate+"</h4><h2>" + item.Title + "</h2> <br />" +
                    item.Description;

                    html += "<br /><br />" +
                    "<a href = \"" + item.Link + "\" >" + item.Link + "</a><br /><br />" +
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
