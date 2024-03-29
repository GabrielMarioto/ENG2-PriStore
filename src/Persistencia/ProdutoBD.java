/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import Model.Marca;
import Model.Produto;
import Model.Promocao;
import Util.Banco;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class ProdutoBD
{

    //#1 = INTEIRO
    //'#1' = STRING
    public boolean insertProduto(Produto p)
    {
        String sql = "insert into produto (cod,codCategoria, nome, preco, descricao, codMarca, codColecao) values (#1,#2, '#3', #4, '#5', #6, #7)";
        sql = sql.replaceAll("#1", "" + p.getCod());
        sql = sql.replaceAll("#2", "" + p.getCodCategoria().getCod());
        sql = sql.replaceAll("#3", "" + p.getNome());
        sql = sql.replaceAll("#4", "" + p.getPreco());
        sql = sql.replaceAll("#5", "" + p.getDescricao());
        sql = sql.replaceAll("#6", "" + p.getCodMarca().getCod());
        sql = sql.replaceAll("#7", "" + p.getCodColecao().getCod());
        return Banco.getCon().manipular(sql);
    }

    public boolean updateProduto(Produto p)
    {
        String sql = "update produto set codCategoria=#1, nome= '#2', preco =#3, descricao ='#4', codMarca = #5, codColecao = #6 where cod =" + p.getCod();
        sql = sql.replaceAll("#1", "" + p.getCodCategoria().getCod());
        sql = sql.replaceAll("#2", "" + p.getNome());
        sql = sql.replaceAll("#3", "" + p.getPreco());
        sql = sql.replaceAll("#4", "" + p.getDescricao());
        sql = sql.replaceAll("#5", "" + p.getCodMarca().getCod());
        sql = sql.replaceAll("#6", "" + p.getCodColecao().getCod());  
        return Banco.getCon().manipular(sql);
    }
    
    
    public boolean deleteProduto(Produto p)
    {
        return Banco.getCon().manipular("delete from produto where cod =" + p.getCod());
    }

    public Produto get(int cod)
    {
        Produto p = null;
        ResultSet rs = Banco.getCon().consultar("select * from produto where cod =" + cod);
        try
        {
            if (rs.next())
            {
                p = new Produto(rs.getInt("cod"), new CategoriaBD().get(rs.getInt("codCategoria")), rs.getString("nome"),
                        rs.getFloat("preco"), rs.getString("descricao"), new MarcaBD().get(rs.getInt("codMarca")),
                        new ColecaoBD().get(rs.getInt("codColecao")));
            }
        } catch (SQLException ex)
        {

        }

        return p;
    }

    public List<Produto> get(String filtro)
    {
        String sql = "select * from produto";
        if (!filtro.isEmpty())
        {
            sql += " where " + filtro;
        }
        List<Produto> aux = new ArrayList();
        ResultSet rs = Banco.getCon().consultar(sql);
        try
        {
            while (rs.next())
            {
                aux.add(new Produto(rs.getInt("cod"), new CategoriaBD().get(rs.getInt("codCategoria")), rs.getString("nome"), rs.getFloat("preco"),
                        rs.getString("descricao"), new MarcaBD().get(rs.getInt("codMarca")), new ColecaoBD().get(rs.getInt("codColecao"))));
            }
            
        } catch (SQLException ex)
        {

        }
        return aux;
    }
}
