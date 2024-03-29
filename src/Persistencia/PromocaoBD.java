/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Persistencia;

import Model.Marca;
import Model.Produto;
import Model.ProdutoPm;
import Model.Promocao;
import Util.Banco;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class PromocaoBD
{

    //#1 = INTEIRO
    //'#1' = STRING
    public boolean insertPromocao(Promocao p,List<ProdutoPm> lista) throws SQLException
    {
        boolean ok= false;
        try{
            Banco.getCon().getConnect().setAutoCommit(false);
            String sql = "insert into promocao (cod,nome, datainicio, datafinal, tipo,valorpromocao) values (#1,'#2', '#3' , '#4', '#5', #6)";
            sql = sql.replaceAll("#1", "" + p.getCodigo());
            sql = sql.replaceAll("#2", "" + p.getNome());
            sql = sql.replaceAll("#3", "" + p.getInicio());
            sql = sql.replaceAll("#4", "" + p.getFim());
            sql = sql.replaceAll("#5", "" + p.getTipo());
            sql = sql.replaceAll("#6", "" + p.getValor());
            ok=Banco.getCon().manipular(sql);
            int i=0;
            while(ok && i<lista.size())
            {
                sql = "insert into prodpromo (prod_cod,promo_cod,ativo,valordesc) values (#1,#2,#3,#4)";
                sql = sql.replaceAll("#1", "" + (lista.get(i).getCod()));
                sql = sql.replaceAll("#2", "" + p.getCodigo());
                sql = sql.replaceAll("#3", "true");
                sql = sql.replaceAll("#4", "" + (lista.get(i).getPreco()-lista.get(i).getPreco2()));
                ok = Banco.getCon().manipular(sql);
                i++;
            }
        }
        catch(SQLException ex)
        {
            ok=false;
        }
        if(ok)
            Banco.getCon().getConnect().commit();
        else
             Banco.getCon().getConnect().rollback();
        Banco.getCon().getConnect().setAutoCommit(true);
        return ok;
    }

    public boolean updatePromocao(Promocao p,List<ProdutoPm> lista) throws SQLException
    {
        boolean ok= false;
        try{
            Banco.getCon().getConnect().setAutoCommit(false);
            boolean flag=true;
            if(p.getFim().toLocalDate().isBefore(LocalDate.now()))
                            flag=!flag;
            String sql = "update promocao set  nome= '#2', datainicio ='#3', datafinal ='#4', tipo = '#5', valorpromocao = #6 where cod =" + p.getCodigo();
            sql = sql.replaceAll("#2", "" + p.getNome());
            sql = sql.replaceAll("#3", "" + p.getInicio());
            sql = sql.replaceAll("#4", "" + p.getFim());
            sql = sql.replaceAll("#5", "" + p.getTipo());
            sql = sql.replaceAll("#6", "" + p.getValor());
            ok=Banco.getCon().manipular(sql);
            int i=0;
            
            ResultSet rs = Banco.getCon().consultar("select promo_cod from prodpromo where promo_cod ="+p.getCodigo());   
                if(rs.next())
                {
                    sql = "delete from prodpromo where promo_cod= "+p.getCodigo(); 
                    ok = Banco.getCon().manipular(sql);
                }
            while(ok && i<lista.size())
            {
                 rs = Banco.getCon().consultar("select promo_cod from prodpromo where ativo= true and prod_cod ="+lista.get(i).getCod());
                 
                 if(rs.next())
                 {
                      ok = Banco.getCon().manipular("delete from prodpromo where ativo=true and prod_cod ="+lista.get(i).getCod());
                 }      
                if(ok)
                {
                        sql = "insert into prodpromo (prod_cod,promo_cod,ativo,valordesc) values (#1,#2,#3,#4)";
                        sql = sql.replaceAll("#1", "" + lista.get(i).getCod());
                        sql = sql.replaceAll("#2", "" + p.getCodigo());                     
                        sql = sql.replaceAll("#3", ""+flag);
                        sql = sql.replaceAll("#4", "" + (lista.get(i).getPreco()-lista.get(i).getPreco2()));
                        ok = Banco.getCon().manipular(sql); 
                }
                 i++;
            }
        }
        catch(SQLException ex)
        {
            ok=false;
        }
        if(ok)
            Banco.getCon().getConnect().commit();
        else
             Banco.getCon().getConnect().rollback();
        Banco.getCon().getConnect().setAutoCommit(true);
        return ok;
       
    }

    public boolean deletePromocao(Promocao p) throws SQLException
    {
        boolean ok = true;
        try {
            Banco.getCon().getConnect().setAutoCommit(false);
            ResultSet rs = Banco.getCon().consultar("select promo_cod from prodpromo where promo_cod ="+p.getCodigo());
            if(rs.next())
                ok = Banco.getCon().manipular("delete from prodpromo where promo_cod="+p.getCodigo());
            if(ok)
                ok = Banco.getCon().manipular("delete from promocao where cod =" + p.getCodigo());
            
        } catch (SQLException ex) {
            ok=false;
        }
        if(ok)
            Banco.getCon().getConnect().commit();
        else
             Banco.getCon().getConnect().rollback();
        Banco.getCon().getConnect().setAutoCommit(true);
        return ok;
    }

    public Promocao get(int cod)
    {
        Promocao p = null;
        ResultSet rs = Banco.getCon().consultar("select * from promocao where cod =" + cod);
        try
        {
            if (rs.next())
            {
                p = new Promocao(rs.getInt("cod"), rs.getString("nome"), rs.getDate("datainicio"), rs.getDate("datafinal"),rs.getString("tipo"),rs.getDouble("valorpromocao"));
            }
        } catch (SQLException ex)
        {

        }

        return p;
    }

    public List<Promocao> get(String filtro)
    {
        String sql = "select * from promocao";
        if (!filtro.isEmpty())
        {
            sql += " where " + filtro;
        }
        List<Promocao> aux = new ArrayList();
        ResultSet rs = Banco.getCon().consultar(sql);
        try
        {
            while (rs.next())
            {
                aux.add(new Promocao(rs.getInt("cod"), rs.getString("nome"), rs.getDate("datainicio"), rs.getDate("datafinal"),rs.getString("tipo"),rs.getDouble("valorpromocao")));
            }
        } catch (SQLException ex)
        {

        }
        return aux;
    }
}
