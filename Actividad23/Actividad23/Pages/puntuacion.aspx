<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="puntuacion.aspx.cs" Inherits="Actividad23.Pages.puntuacion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenedorMain">
        <div class="divTablaPuntuacion">
            <div class="divHijoTablaPuntuacion">
                <asp:Table ID="Table1" runat="server" CssClass="table tablaPuntuacion"></asp:Table>
            </div>
        </div>
    </div>
    <%--table-striped--%>
</asp:Content>
