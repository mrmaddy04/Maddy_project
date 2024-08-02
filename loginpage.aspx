<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" EnableViewState="true" EnableEventValidation="true" Inherits="MaddyWeb.loginpage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User-Login</title>
    <link href="CSS/logincss.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
        <div style="margin-right: 0px; margin-left: 0px" class="row">
            <div class="col-md-6 mx-auto p-0">
                <div class="card">
                    <div class="login-box">
                        <div class="login-snip">
                            <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label>
                            <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                            <div class="login-space">
                                <div class="login">
                                    <div class="group">
                                        <label for="txt_username" class="label">Username</label>
                                        <asp:TextBox runat="server" CssClass="input" ID="txt_username" placeholder="Enter your username"></asp:TextBox>
                                    </div>
                                    <div class="group">
                                        <label for="txt_password" class="label">Password</label>
                                        <asp:TextBox runat="server" TextMode="Password" CssClass="input" ID="txt_password" placeholder="Enter your password"></asp:TextBox>
                                    </div>
                                    <div class="group">
                                        <input id="check" type="checkbox" class="check" checked>
                                        <label for="check"><span class="icon"></span>Keep me Signed in</label>
                                    </div>
                                    <div class="group">
                                        <%--<asp:Button runat="server" CssClass="button" ID="btn_login" Text="Sign In" OnClick="btn_login_Click" />--%>
                                       
                                    </div>
                                    
                                    <div class="hr"></div>
                                    <div class="foot">
                                                       <asp:Button runat="server" CssClass="btn btn-info" Enabled="true" ID="btn_logincheck" Text="Login" CausesValidation="false"  OnClick="btn_logincheck_Click" />
                                        <a href="#">Forgot Password?</a>
                                    </div>
                                </div>
                  
                                
                                <div class="sign-up-form">
                                    <div class="group">
                                        <label for="txt_user" class="label">Username</label>
                                        <asp:TextBox runat="server" CssClass="input" ID="txt_user" placeholder="Create your Username"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_user" ErrorMessage="Username is required." CssClass="error" Display="Dynamic" />
                                    </div>
                                    <div class="group">
                                        <label for="txt_create_password" class="label">Password</label>
                                        <asp:TextBox runat="server" CssClass="input" ID="txt_create_password" TextMode="Password" placeholder="Create your password"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_create_password" ErrorMessage="Password is required." CssClass="error" Display="Dynamic" />
                                    </div>
                                    <div class="group">
                                        <label for="txt_confirm_password" class="label">Repeat Password</label>
                                        <asp:TextBox runat="server" CssClass="input" ID="txt_confirm_password" TextMode="Password" placeholder="Repeat your password"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_confirm_password" ErrorMessage="Confirm Password is required." CssClass="error" Display="Dynamic" />
                                        <asp:CompareValidator runat="server" ForeColor="aliceblue" ControlToCompare="txt_create_password" ControlToValidate="txt_confirm_password" ErrorMessage="Passwords do not match." CssClass="error" Display="Dynamic" />
                                    </div>
                                    <div class="group">
                                        <label for="txt_email" class="label">Email Address</label>
                                        <asp:TextBox runat="server" CssClass="input" TextMode="Email" ID="txt_email" placeholder="Enter your email address"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_email" ErrorMessage="Email is required." CssClass="error" Display="Dynamic" />
                                        <asp:RegularExpressionValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_email" ErrorMessage="Invalid email format." CssClass="error" Display="Dynamic"
                                            ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
                                    </div>
                                    <div class="group">
                                        <label for="txt_mobileNo" class="label">Mobile No</label>
                                        <asp:TextBox runat="server" CssClass="input" ID="txt_mobileNo" placeholder="Enter your MobileNo"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_mobileNo" ErrorMessage="Mobile number is required." CssClass="error" Display="Dynamic" />
                                        <asp:RegularExpressionValidator runat="server" ForeColor="aliceblue" ControlToValidate="txt_mobileNo" ErrorMessage="Invalid mobile number format." CssClass="error" Display="Dynamic"
                                            ValidationExpression="^\d{10}$" />
                                    </div>
                                    <div class="group">
                                        <asp:Button runat="server" ID="btn_signup" Text="Submit" CssClass="button" OnClick="btn_signup_Click" />
                                    </div>

                                    <div class="hr"></div>
                                    <div class="foot">
                                        <label for="tab-1">Already Member?</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
     <!-- Include jQuery library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Include Bootstrap JS bundle (includes Popper.js) -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
