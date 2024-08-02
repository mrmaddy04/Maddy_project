using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace MaddyWeb
{

    public partial class loginpage : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initial setup code here
            }
        }

        public void member_Register()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {

                try
                {
                    connection.Open();

                    string query = " Insert into tbl_studentdetails (email,mobile_no,username,password,createdby,createdon,modifiedby,modifiedon,status,isdeleted)" +
                        " Values(@email,@mobile_no,@username,@password,@createdby,@createdon,@modifiedby,@modifiedon,@status,@isdeleted)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@email", txt_email.Text.ToString());
                        command.Parameters.AddWithValue("@mobile_no", txt_mobileNo.Text.ToString());
                        command.Parameters.AddWithValue("@username", txt_user.Text.ToString());
                        command.Parameters.AddWithValue("@password", txt_confirm_password.Text.ToString());
                        command.Parameters.AddWithValue("@createdby", 1);
                        command.Parameters.AddWithValue("@createdon", DateTime.Now);
                        command.Parameters.AddWithValue("@modifiedby", 1);
                        command.Parameters.AddWithValue("@modifiedon", DateTime.Now);
                        command.Parameters.AddWithValue("@status", 1);
                        command.Parameters.AddWithValue("@isdeleted", 0);

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("Insert successful.");
                        }
                        else
                        {
                            Response.Write("Insert failed.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
            clearvalue();
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            member_Register();

        }

        private void clearvalue()
        {
            txt_email.Text = string.Empty;
            txt_user.Text = string.Empty;
            txt_password.Text = string.Empty;
            txt_confirm_password.Text = string.Empty;
            txt_mobileNo.Text = string.Empty;
        }


        protected void btn_login_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT * FROM tbl_studentdetails WHERE username = @Username AND password = @Password AND isdeleted = 0";
                    //string query = "SELECT * FROM tbl_userdetails WHERE username ='"+txt_username.Text.ToString()+ "' AND password = '"+txt_password.Text.ToString()+"' AND isdeleted = 0";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", txt_username.Text.ToString());
                        command.Parameters.AddWithValue("@Password", txt_password.Text.ToString());

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // User found, login successful
                                string userId = reader["user_id"].ToString(); // Assuming there is a user_id column
                                string email = reader["email"].ToString();
                                string mobileNo = reader["mobile_no"].ToString();
                                // Get other necessary fields...

                                // Example of how you might display a success message and user details
                                Response.Write("Login successful.<br>");
                                Response.Write("User ID: " + userId + "<br>");
                                Response.Write("Email: " + email + "<br>");
                                Response.Write("Mobile No: " + mobileNo + "<br>");
                                // Add other user details as needed

                                // You can also store user information in session variables if needed
                                Session["UserId"] = userId;
                                Session["Email"] = email;
                                // Add other session variables as needed

                                // Redirect to a different page if necessary

                                Response.Redirect("Home.aspx");
                            }
                            else
                            {
                                // User not found or incorrect password
                                Response.Write("Login failed. Please check your username and password.");
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write("SQL Error: " + ex.Message);
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        protected void btn_logincheck_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT * FROM tbl_userdetails WHERE username = @Username AND password = @Password AND isdeleted = 0";
                    //string query = "SELECT * FROM tbl_userdetails WHERE username ='"+txt_username.Text.ToString()+ "' AND password = '"+txt_password.Text.ToString()+"' AND isdeleted = 0";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", txt_username.Text.ToString());
                        command.Parameters.AddWithValue("@Password", txt_password.Text.ToString());

                        using (SqlDataReader reader = command.ExecuteReader())

                        {
                            if (reader.Read())
                            {
                                // User found, login successful
                                string login_id = reader["login_id"].ToString(); // Assuming there is a user_id column
                                string email = reader["email"].ToString();
                                string mobileNo = reader["mobile_no"].ToString();
                                // Get other necessary fields...

                                // Example of how you might display a success message and user details
                                Response.Write("Login successful.<br>");
                                Response.Write("Login ID: " + login_id + "<br>");
                                Response.Write("Email: " + email + "<br>");
                                Response.Write("Mobile No: " + mobileNo + "<br>");
                                // Add other user details as needed

                                // You can also store user information in session variables if needed
                                Session["login_id"] = login_id;
                                Session["Email"] = email;
                                // Add other session variables as needed

                                // Redirect to a different page if necessary

                                Response.Redirect("Home.aspx");
                            }
                            else
                            {
                                // User not found or incorrect password
                                Response.Write("Login failed. Please check your username and password.");
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write("SQL Error: " + ex.Message);
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}
