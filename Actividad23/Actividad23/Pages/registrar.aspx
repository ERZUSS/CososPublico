<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="registrar.aspx.cs" Inherits="Actividad23.Pages.registrar" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="registrar">
        <h1>Registrar</h1>
        <div class="input-group input-group-lg">
            <span class="input-group-addon" id="basic-addon1">Campo 1</span>
            <asp:TextBox ID="iNombreR" CssClass="form-control inputRegistro" runat="server" placeholder="Inserte Nombre" aria-describedby="basic-addon1"></asp:TextBox>
        </div>
        <div class="input-group input-group-lg">
            <span class="input-group-addon" id="basic-addon2">Campo 2</span>
            <asp:TextBox ID="iContrasennaR" CssClass="form-control inputRegistro" TextMode="Password" runat="server" placeholder="Crea una Contraseña" aria-describedby="basic-addon2"></asp:TextBox>
        </div>
        <div class="input-group input-group-lg">
            <span class="input-group-addon" id="basic-addon3">Campo 3</span>
            <asp:TextBox ID="iContrasenna2R" CssClass="form-control inputRegistro" TextMode="Password" runat="server" placeholder="Repita la Contraseña" aria-describedby="basic-addon3"></asp:TextBox>
        </div>
        <asp:Label ID="lValidacion" runat="server" Text="" CssClass="tc"></asp:Label><br />
        <asp:Label ID="lValidacionCorrecto" runat="server" Text="" CssClass="tc tv"></asp:Label><br />
        <asp:Button CssClass="btn btn-primary" ID="btnLogin" runat="server" Text="Crear" OnClick="crearUsuario"/>
    </div>
</asp:Content>
