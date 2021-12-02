using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace HovidAssessmentTest
{
    public class Database
    {
        private string connStr = ConfigurationManager.ConnectionStrings["HovidConnString"].ConnectionString;

        public Database()
        {
                
        }

        public DataTable ExecuteSelectQuery(string userId)
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SelectUser";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", userId);

            try
            {
                conn.Open();
                dt.Load(cmd.ExecuteReader());
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                conn.Close();
            }

            return dt;
        }
        public DataTable ExecuteSelectQuery()
        {
            DataTable dt = new DataTable();

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SelectAllUser";
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                conn.Open();
                dt.Load(cmd.ExecuteReader());
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                conn.Close();
            }

            return dt;
        }

        public bool ExecuteInsertQuery(String username,string userNo)
        {
            bool isSuccess = false;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "CreateUser";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserName", username);
            cmd.Parameters.AddWithValue("@UserNo", userNo);

            try
            {
                conn.Open();
                isSuccess = Convert.ToBoolean(cmd.ExecuteNonQuery());
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                conn.Close();
            }

            return isSuccess;
        }

        public bool ExecuteUpdateQuery(string userId, String username,string userNo)
        {
            bool isSuccess = false;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "UpdateUser";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", userId);
            cmd.Parameters.AddWithValue("@UserName", username);
            cmd.Parameters.AddWithValue("@UserNo", userNo);

            try
            {
                conn.Open();
                isSuccess = Convert.ToBoolean(cmd.ExecuteNonQuery());
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                conn.Close();
            }

            return isSuccess;
        }

        public bool ExecuteDeleteQuery(string userId)
        {
            bool isSuccess = false;

            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "DeleteUser";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", userId);

            try
            {
                conn.Open();
                isSuccess = Convert.ToBoolean(cmd.ExecuteNonQuery());
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                conn.Close();
            }

            return isSuccess;
        }
    }

}