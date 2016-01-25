<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/MasterPage.master" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
        bool side = false;
        foreach (string lat in latin)
        {
            string html = "";
            if(side)
            {
                 html = "<br />" +
    "<div style=\"border:medium; border-color:black; width:85%; min-height:200px; background-color:azure; margin-left:2%;\">" +
                "<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\"></span>" +
                "<br />" +
                "<div style=\"font-size:14px; margin-left:5%; margin-right:auto;\">" +
                    "<b>" +
                lat +
                    "</b>" +
                "</div>" +
            "</div>";
                side = false;
            }
            else
            {
                html = "<br />" +
    "<div style=\"border:medium; border-color:black; width:85%; min-height:200px; background-color:azure; margin-left:auto; margin-right:5%;\" align=\"right\">" +
                "<span class=\"glyphicon glyphicon-asterisk\" aria-hidden=\"true\"></span>" +
                "<br />" +
                "<div style=\"font-size:14px; margin-left:auto; margin-right:5%;\">" +
                    "<b>" +
                lat +
                    "</b>" +
                "</div>" +
            "</div>";
                side = true;
            }
            Response.Write(html);
        }
    %>
</asp:Content>
