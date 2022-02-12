<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Actividad23.Pages.login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login">
        <h1>Login</h1>
        <div class="input-group input-group-lg">
            <span class="input-group-addon" id="basic-addon1">Nombre</span>
            <asp:TextBox ID="iNombreL" CssClass="form-control inputRegistro" runat="server" placeholder="Nombre" aria-describedby="basic-addon1"></asp:TextBox>
        </div>
        <div class="input-group input-group-lg">
            <span class="input-group-addon" id="basic-addon2">Contraseña</span>
            <asp:TextBox ID="iContrasennaL" CssClass="form-control inputRegistro" TextMode="Password" runat="server" placeholder="Contraseña" aria-describedby="basic-addon2"></asp:TextBox>
        </div>
        <div>
            <asp:Label ID="lValidacionL" runat="server" Text="" CssClass="tc"></asp:Label>
            <asp:Label ID="lValidacionLCorrecto" runat="server" Text="" CssClass="tc tv"></asp:Label>
        </div>
        <div class="row">
            <div class="col-md-6">
                <asp:Button CssClass="btn btn-primary" ID="btnLogin" runat="server" Text="Login" OnClick="loguear"/>
            </div>
            <div class="col-md-6">
                <asp:Button CssClass="btn btn-primary" ID="Button2" runat="server" Text="Registrarme" OnClick="goRegistro"/>
            </div>
        </div>
        
    </div>
</asp:Content>
