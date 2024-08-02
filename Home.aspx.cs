using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MaddyWeb
{
    public partial class Home : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // BindGridView();
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "INSERT INTO tbl_studentdetails (name, dob, gender, department, created_by, created_on, modified_by, modified_on, status, is_deleted) " +
                                   "VALUES (@name, @dob, @gender, @department, @created_by, @created_on, @modified_by, @modified_on, @status, @is_deleted)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@name", txt_name.Text);
                        command.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDate.Text));
                        command.Parameters.AddWithValue("@gender", txt_gender.SelectedValue);
                        command.Parameters.AddWithValue("@department", txt_department.SelectedValue);
                        command.Parameters.AddWithValue("@created_by", 1); // Replace with actual user ID
                        command.Parameters.AddWithValue("@created_on", DateTime.Now);
                        command.Parameters.AddWithValue("@modified_by", 1); // Replace with actual user ID
                        command.Parameters.AddWithValue("@modified_on", DateTime.Now);
                        command.Parameters.AddWithValue("@status", 1); // Set appropriate status
                        command.Parameters.AddWithValue("@is_deleted", 0); // Set appropriate deletion status

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            Response.Write("<script>Swal.fire({ title: 'Success!', text: 'Insert successful.', icon: 'success' });</script>");
                            BindGridView(); // Refresh the GridView with the new data
                        }
                        else
                        {
                            Response.Write("<script>Swal.fire({ title: 'Failed!', text: 'Insert failed.', icon: 'error' });</script>");
                        }
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write($"<script>Swal.fire({{ title: 'Error!', text: 'A SQL error occurred: {ex.Message}', icon: 'error' }}).then(() => {{ window.location.reload(); }});</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>Swal.fire({{ title: 'Error!', text: 'An error occurred: {ex.Message}', icon: 'error' }}).then(() => {{ window.location.reload(); }});</script>");
                }
            }
            clearvalue();
            BindGridView();
        }

        public void clearvalue()
        {
            txt_name.Text = string.Empty;
            txtDate.Text = string.Empty;

            foreach (ListItem item in txt_gender.Items)
            {
                item.Selected = false;
            }

            txt_department.SelectedIndex = 0;
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            clearvalue();
        }

        public void BindGridView()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT user_id, name, dob, gender, department FROM tbl_studentdetails WHERE is_deleted = 0";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        grd_studentdetails.DataSource = dataTable;
                        grd_studentdetails.DataBind();
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write($"<script>alert('A SQL error occurred: {ex.Message}');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }
        }

        protected void grd_studentdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd_studentdetails.PageIndex = e.NewPageIndex;
            BindGridView();
            grd_studentdetails.DataBind();
        }


        protected void grd_studentdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CustomEdit")
            {
                int userId;
                if (int.TryParse(e.CommandArgument.ToString(), out userId))
                {
                    EditRecord(userId);
                }
                else
                {
                    Response.Write("<script>alert('Invalid user ID');</script>");
                }
            }
            else if (e.CommandName == "CustomDelete")
            {
                int userId;
                if (int.TryParse(e.CommandArgument.ToString(), out userId))
                {
                    DeleteRecord(userId);
                }
                else
                {
                    Response.Write("<script>alert('Invalid user ID');</script>");
                }
            }
        }

        private void EditRecord(int userId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    string query = "SELECT name, dob, gender, department FROM tbl_studentdetails WHERE user_id = @user_id";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@user_id", userId);
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.Read())
                        {
                            txt_name.Text = reader["name"].ToString();
                            txtDate.Text = Convert.ToDateTime(reader["dob"]).ToString("yyyy-MM-dd");
                            txt_gender.SelectedValue = reader["gender"].ToString();
                            txt_department.SelectedValue = reader["department"].ToString();

                            ViewState["EditUserId"] = userId; // Save user ID in ViewState for later use
                        }
                    }
                }
                catch (SqlException ex)
                {
                    Response.Write($"<script>alert('A SQL error occurred: {ex.Message}');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }

            // Show the update button and hide the save button
            btn_update.Visible = true;
            btn_save.Visible = false;
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            if (ViewState["EditUserId"] != null)
            {
                int userId = Convert.ToInt32(ViewState["EditUserId"]);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    try
                    {
                        connection.Open();
                        string query = "UPDATE tbl_studentdetails SET name = @name, dob = @dob, gender = @gender, department = @department, modified_on = @modified_on WHERE user_id = @user_id";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@name", txt_name.Text);
                            command.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDate.Text));
                            command.Parameters.AddWithValue("@gender", txt_gender.SelectedValue);
                            command.Parameters.AddWithValue("@department", txt_department.SelectedValue);
                            command.Parameters.AddWithValue("@modified_on", DateTime.Now);
                            command.Parameters.AddWithValue("@user_id", userId);

                            int rowsAffected = command.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                Response.Write("<script>Swal.fire({ title: 'Success!', text: 'Update successful.', icon: 'success' });</script>");
                                BindGridView(); // Refresh the GridView with the new data
                            }
                            else
                            {
                                Response.Write("<script>Swal.fire({ title: 'Failed!', text: 'Update failed.', icon: 'error' });</script>");
                            }
                        }
                    }
                    catch (SqlException ex)
                    {
                        Response.Write($"<script>Swal.fire({{ title: 'Error!', text: 'A SQL error occurred: {ex.Message}', icon: 'error' }}).then(() => {{ window.location.reload(); }});</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"<script>Swal.fire({{ title: 'Error!', text: 'An error occurred: {ex.Message}', icon: 'error' }}).then(() => {{ window.location.reload(); }});</script>");
                    }
                }
                clearvalue();
                btn_update.Visible = false;
                btn_save.Visible = true;
            }
        }


        private void DeleteRecord(int userId)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "UPDATE tbl_studentdetails SET is_deleted=1 WHERE user_id=@user_id";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@user_id", userId);
                    command.ExecuteNonQuery();
                }
            }

            // Rebind the GridView to reflect changes
            BindGridView();
        }
    }
}
