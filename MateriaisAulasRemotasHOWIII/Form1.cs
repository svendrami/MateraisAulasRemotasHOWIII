using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace MateriaisAulasRemotasHOWIII
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            atualizarGrid();
        }

        private void atualizarGrid()
        {
            //Crio a estrutura da conexão com o banco e passa os parametros
            MySqlConnectionStringBuilder conexaoBD = new MySqlConnectionStringBuilder();
            conexaoBD.Server = "localhost";
            conexaoBD.Database = "materialaulasremotas";
            conexaoBD.UserID = "root";
            conexaoBD.Password = "";
            //Realizo a conexão com o banco
            MySqlConnection realizaConexacoBD = new MySqlConnection(conexaoBD.ToString());
            try
            {
                realizaConexacoBD.Open();

                MySqlCommand comandoMySql = realizaConexacoBD.CreateCommand();
                comandoMySql.CommandText = "SELECT idMaterial, TituloMaterial, DescricaoMaterial, LinkdaAula, LinkMaterial from materiais"; //Traz todo mundo da tabela autor
                MySqlDataReader reader = comandoMySql.ExecuteReader();

                dataGridView1.Rows.Clear();//FAZ LIMPAR A TABELA

                while (reader.Read())
                {
                    DataGridViewRow row = (DataGridViewRow)dataGridView1.Rows[0].Clone();//FAZ UM CAST E CLONA A LINHA DA TABELA
                    row.Cells[0].Value = reader.GetInt32(0);//ID
                    row.Cells[1].Value = reader.GetString(1);//TÍTULO DO MATERIAL
                    row.Cells[2].Value = reader.GetString(2);//dESCRIÇÃO
                    row.Cells[3].Value = reader.GetString(3);//LINK DA AULA
                    row.Cells[4].Value = reader.GetString(4);//LINK MATERIAL COMPLEMENTAR
                    dataGridView1.Rows.Add(row);//ADICIONO A LINHA NA TABELA
                }

                realizaConexacoBD.Close();
                //MessageBox.Show("Removido com sucesso"); ;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Can not open connection ! ");
                Console.WriteLine(ex.Message);
            }


        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            //Crio a estrutura da conexão com o banco e passa os parametros
            MySqlConnectionStringBuilder conexaoBD = new MySqlConnectionStringBuilder();
            conexaoBD.Server = "localhost";
            conexaoBD.Database = "materialaulasremotas";
            conexaoBD.UserID = "root";
            conexaoBD.Password = "";
            //Realizo a conexão com o banco
            MySqlConnection realizaConexacoBD = new MySqlConnection(conexaoBD.ToString());
            try
            {
                realizaConexacoBD.Open(); //Abre a conexão com o banco
               // MessageBox.Show("Conexão Aberta!"); // deu certo a conexão

                MySqlCommand comandoMySql = realizaConexacoBD.CreateCommand(); //Crio um comando SQL
                comandoMySql.CommandText = "INSERT INTO materiais (TituloMaterial,DescricaoMaterial,LinkdaAula, LinkMaterial) " +
                    "VALUES('" + textBoxTitulo.Text + "', '" + textBoxDescricao.Text + "', '" + textBoxLinkaula.Text + "', '" + textBoxLinkmatcomplementar.Text + "')";
                comandoMySql.ExecuteNonQuery();

                realizaConexacoBD.Close(); // Fecho a conexão com o banco
                MessageBox.Show("Material da aula remota inserido com sucesso!"); //Exibo mensagem de aviso
                atualizarGrid();
                textBoxTitulo.Text = "";
                textBoxDescricao.Text = "";
                textBoxLinkaula.Text = "";
                textBoxLinkmatcomplementar.Text = "";
            }
            catch (Exception ex)
            {
                //MessageBox.Show("Não foi possivel abrir a conexão! ");
                Console.WriteLine(ex.Message);
            }

        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}

