/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Persistencia.ProdutoBD;
import Util.Banco;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabriel
 */
public class Produto
{

    private int cod;
    private Categoria codCategoria;
    private String nome;
    private float preco;
    private String descricao;
    private Marca codMarca;
    private Colecao codColecao;

    public Produto(int cod, Categoria codCategoria, String nome, float preco, String descricao, Marca codMarca, Colecao codColecao)
    {
        this.cod = cod;
        this.codCategoria = codCategoria;
        this.nome = nome;
        this.preco = preco;
        this.descricao = descricao;
        this.codMarca = codMarca;
        this.codColecao = codColecao;
    }
  
    
    public Produto()
    {

    }



    public int getCod()
    {
        return cod;
    }

    public void setCod(int cod)
    {
        this.cod = cod;
    }

    public Categoria getCodCategoria()
    {
        return codCategoria;
    }

    public void setCodCategoria(Categoria codCategoria)
    {
        this.codCategoria = codCategoria;
    }

    public String getNome()
    {
        return nome;
    }

    public void setNome(String nome)
    {
        this.nome = nome;
    }

    public float getPreco()
    {
        return preco;
    }

    public void setPreco(float preco)
    {
        this.preco = preco;
    }

    public String getDescricao()
    {
        return descricao;
    }

    public void setDescricao(String descricao)
    {
        this.descricao = descricao;
    }

    public Marca getCodMarca()
    {
        return codMarca;
    }

    public void setCodMarca(Marca codMarca)
    {
        this.codMarca = codMarca;
    }

    public Colecao getCodColecao()
    {
        return codColecao;
    }

    public void setCodColecao(Colecao codColecao)
    {
        this.codColecao = codColecao;
    }
    
    public boolean insert()
    {
        cod= Banco.getCon().getMaxPK("Produto", "cod")+1;
        if(cod==0)
            cod=1;
        ProdutoBD prod = new ProdutoBD();
        return prod.insertProduto(this);
    }

    public boolean update()
    {
        ProdutoBD prod = new ProdutoBD();
        return prod.updateProduto(this);
    }
    
    public boolean delete()
    {
        ProdutoBD prod = new ProdutoBD();
        return prod.deleteProduto(this);
    }

    public Produto selectProduto(int cod)
    {
        Produto p;
        ProdutoBD prod = new ProdutoBD();
        p = prod.get(cod);
        return p;
    }

    public List<Produto> selectProduto(String filtro)
    {
        List<Produto> aux = new ArrayList();
        ProdutoBD prod = new ProdutoBD();
        aux = prod.get(filtro);

        return aux;
    }

    @Override
    public String toString()
    {
        return nome;
    }
}
