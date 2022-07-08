<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplicationGestao._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
<fieldset style="width:500px">
    <legend>Enter Registration Details </legend>
        <table >
            <tr>
                <td>
                    CPF</td>
                <td>
                    <asp:TextBox ID="txtCPF" runat="server" style="margin-right: 59px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Nome</td>
                <td>
                    <asp:TextBox ID="txtNome" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tipo</td>
                <td>
                    <asp:TextBox ID="txtTipo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Sexo</td>
                <td>
                    <asp:TextBox ID="txtSexo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Situação</td>
                <td>
                    <asp:TextBox ID="txtSituacao" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    <asp:Button ID="btnCriar" runat="server" Text="Criar"
                        onclick="btnSubmit_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar"
                        onclick="btnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblStatus" runat="server" Text="" style="color: #FF3300"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdCliente" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="cpf" CellPadding="5" ForeColor="#333333">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                                            <asp:TemplateField HeaderText="CPF" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcpf" runat="server" Text='<%#Eval("cpf") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Nome" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblNome" runat="server" Text='<%#Eval("nome") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Tipo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTipo" runat="server" Text='<%#Eval("tipoCliente") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sexo" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsexo" runat="server" Text='<%#Eval("sexo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Situação" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSituacao" runat="server" Text='<%#Eval("situacaoCliente") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Editar" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Button ID="imgBtn" runat="server" CausesValidation="false" CommandArgument='<%#Eval("cpf") %>'
                                                        OnCommand="imgEdit_Command" ImageUrl="~/Images/edit.png"
                                                        ToolTip="Edit" />
                                                </ItemTemplate>                                              

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Deletar" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                                             
                                                <ItemTemplate>
                                                    <asp:Button ID="imgDel" runat="server" CausesValidation="false" CommandArgument='<%#Eval("cpf") %>'
                                                        CommandName="Delete" OnCommand="imgDel_Command" ImageUrl="~/Images/delete.png"
                                                        ToolTip="Delete" OnClientClick="return confirm('Tem certeza que quer deletar?')"   />
                                                </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>
                                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </fieldset>
   </div>

</asp:Content>
