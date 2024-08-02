<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MaddyWeb.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Maddy-Web</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />--%>

    <style>
        .container {
            text-align: center;
            padding: 15px;
            justify-content: center;
            margin-top: 20px;
        }

        .detail {
            font-size: 15px;
            font-weight: 500;
            flex-wrap: nowrap;
            align-items: center;
            flex-direction: row;
            color: blueviolet;
        }

        .head {
            background-color: #e4efb5;
            border: 2px solid white;
            border-radius: 50px 20px;
        }

        .headlabel {
            font-size: 20px;
            font-weight: 500;
        }
    </style>
</head>
<body>
<%--        <script type="text/javascript">
            function scrollToGridView() {
                document.getElementById('<%= grd_studentdetails.ClientID %>').scrollIntoView({ behavior: 'smooth' });
            }
    </script>--%>

    <form id="form1" runat="server">

        <%--Header of the Application Form--%>

        <div class="container">
            <h1 class="head">Welcome to Student Management..!</h1>
            <p class="detail">This setup provides a robust and stylish form design using ASP.NET and Bootstrap, with advanced features to enhance user experience.</p>
        </div>
        <div class="shadow-sm p-3 mb-5 bg-white rounded">
            <div class="row">
                <div class="col-md-6">

                    <%--Application Form Details Form To Fill--%>

                    <h4>Application Form</h4>
                    <hr />
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Label runat="server" CssClass="headlabel">Student Name:</asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox runat="server" ID="txt_name" placeholder="Enter the Name" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txt_name"
                                ErrorMessage="Name is required." ForeColor="Red" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <asp:Label runat="server" CssClass="headlabel">Date of Birth:</asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" placeholder="Select your date" Style="width: 100%;" ReadOnly="false" />
                            <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate"
                                ErrorMessage="Date of Birth is required." ForeColor="Red" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <asp:Label runat="server" CssClass="headlabel">Gender:</asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:RadioButtonList runat="server" ID="txt_gender" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem class="radio-inline" Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem class="radio-inline" Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem class="radio-inline" Text="Others" Value="Others"></asp:ListItem>
                            </asp:RadioButtonList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="txt_gender"
                                InitialValue="" ErrorMessage="Gender is required." ForeColor="Red" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <asp:Label runat="server" CssClass="headlabel">Department Name:</asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:DropDownList runat="server" ID="txt_department" CssClass="form-control">
                                <asp:ListItem Selected="True" Text="Select the Department" Value=""></asp:ListItem>
                                <asp:ListItem Text="BCA" Value="BCA"></asp:ListItem>
                                <asp:ListItem Text="BSC.(CS)" Value="BSC.(CS)"></asp:ListItem>
                                <asp:ListItem Text="B.COM(CS)" Value="B.COM(CS)"></asp:ListItem>
                                <asp:ListItem Text="BSC (AI)" Value="BSC (AI)"></asp:ListItem>
                                <asp:ListItem Text="BSC(IT)" Value="BSC(IT)"></asp:ListItem>
                                <asp:ListItem Text="MBA(Finance)" Value="MBA(Finance)"></asp:ListItem>
                                <asp:ListItem Text="MSC(CS)" Value="MSC(CS)"></asp:ListItem>
                                <asp:ListItem Text="B.A(Eng)" Value="B.A(Eng)"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ControlToValidate="txt_department"
                                InitialValue="" ErrorMessage="Department is required." ForeColor="Red" Display="Dynamic" />
                        </div>
                    </div>
                    <div class="row mt-4">
                        <div class="col-md-6"></div>
                        <div class="col-md-6">
                            <asp:Button runat="server" CssClass="btn btn-close-white" Text="Cancel" OnClick="btn_cancel_Click" />
                            <asp:Button runat="server" CssClass="btn btn-close-white" Text="Save" ID="btn_save" OnClick="btn_save_Click" />
                            <asp:Button runat="server" CssClass="btn btn-close-white" Text="Update" ID="btn_update" Visible="false" OnClick="btn_update_Click" />
                        </div>
                    </div>
                </div>

                <%--Application Details Table--%>


                <div class="col-md-6">
                    <h4>Application Details</h4>
                    <%--                    <asp:GridView ID="grd_studentdetails" runat="server"
                        AutoGenerateColumns="False" OnRowCommand="grd_studentdetails_RowCommand"
                        AutoGenerateDeleteButton="False" AutoGenerateEditButton="False"
                        HeaderStyle-Width="112px" OnPageIndexChanging="grd_studentdetails_PageIndexChanging"
                        AllowPaging="true" PageSize="10" AllowSorting="true"
                        class="table table-bordered table-condensed table-responsive table-hover">
                        <Columns>
                            <asp:BoundField DataField="user_id" HeaderText="ID" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="dob" HeaderText="Date of Birth" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" />
                            <asp:BoundField DataField="department" HeaderText="Department" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button runat="server" CommandName="CustomEdit" CommandArgument='<%# Eval("user_id") %>' Text="edit" CssClass="btn btn-sm btn-secondary" />
                                    <asp:Button runat="server" CommandName="CustomDelete" CommandArgument='<%# Eval("user_id") %>' Text="delete" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>--%>
                    <asp:GridView ID="grd_studentdetails" runat="server"
                        AutoGenerateColumns="False" OnRowCommand="grd_studentdetails_RowCommand"
                        AutoGenerateDeleteButton="False" AutoGenerateEditButton="False"
                        HeaderStyle-Width="112px" OnPageIndexChanging="grd_studentdetails_PageIndexChanging"
                        AllowPaging="true" PageSize="10" AllowSorting="true"
                        class="table table-bordered table-condensed table-responsive table-hover"
                        OnClientPageIndexChanging="scrollToGridView();">
                        <Columns>
                            <asp:BoundField DataField="user_id" HeaderText="ID" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="dob" HeaderText="Date of Birth" />
                            <asp:BoundField DataField="gender" HeaderText="Gender" />
                            <asp:BoundField DataField="department" HeaderText="Department" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button runat="server" CommandName="CustomEdit" CommandArgument='<%# Eval("user_id") %>' Text="edit" CssClass="btn btn-sm btn-secondary" />
                                    <asp:Button runat="server" CommandName="CustomDelete" CommandArgument='<%# Eval("user_id") %>' Text="delete" CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <%--Confirmation for Deleting Record--%>

        <script type="text/javascript">
            function confirmDelete() {
                return confirm('Are you sure you want to delete this record?');
            }
        </script>


    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

    <!-- Bootstrap DatePicker -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css" type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" type="text/javascript"></script>
</body>
</html>
