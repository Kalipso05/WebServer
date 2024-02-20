<%@ Page Async="true" Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebClient.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server" Font-Names="Cascadia code" Font-Size="Small" Font-Bold="true">
        <asp:Label ID="Label1" runat="server" Text="Госпитализация пациента" BackColor="DarkOrange" ForeColor="White"></asp:Label>
        <br />
        <br />
        Выберите пациента:<br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="LastName" DataValueField="ID" Width="252px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbHospitalConnectionString %>" ProviderName="<%$ ConnectionStrings:dbHospitalConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Patient]"></asp:SqlDataSource>
        <br />
        Имя&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Номер страхового полиса<br />
        <asp:TextBox ID="TextBox1" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox7" runat="server" Width="250"></asp:TextBox>
        <br />
        Фамилия&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Срок действия полиса<br />
        <asp:TextBox ID="TextBox2" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox8" runat="server" Width="250"></asp:TextBox>
        <br />
        Отчество&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Страховая компания<br />
        <asp:TextBox ID="TextBox3" runat="server" Width="250"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox9" runat="server" Width="250"></asp:TextBox>
        <br />
        Серия паспорта<br />
        <asp:TextBox ID="TextBox4" runat="server" Width="250"></asp:TextBox>
        <br />
        Номер паспорта<br />
        <asp:TextBox ID="TextBox5" runat="server" Width="250"></asp:TextBox>
        <br />
        Место работы<br />
        <asp:TextBox ID="TextBox6" runat="server" Width="250"></asp:TextBox>
    </asp:Panel>
</asp:Content>
