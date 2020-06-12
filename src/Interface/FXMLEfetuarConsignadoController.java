/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import static Interface.TelaPrincipalController.spnprincipal;
import Mask.MaskFieldUtil;
import Model.Cliente;
import Model.Compra;
import Model.Consignado;
import Model.Fornecedor;
import Model.Funcionario;
import Model.ItensCompra;
import Model.ItensConsignado;
import Model.Produto;
import Model.Tamanho;
import Model.Usuario;
import Persistencia.ConsignadoBD;
import Persistencia.ItensCompraBD;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXComboBox;
import com.jfoenix.controls.JFXDatePicker;
import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ButtonType;
import javafx.scene.control.ComboBox;
import javafx.scene.control.SplitPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextInputControl;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Bruno
 */
public class FXMLEfetuarConsignadoController implements Initializable
{

    @FXML
    private SplitPane painel;
    @FXML
    private JFXButton btn_Novo;
    @FXML
    private JFXButton btn_Confirmar;
    @FXML
    private JFXButton btn_Cancelar;
    @FXML
    private AnchorPane pndados;
    @FXML
    private JFXTextField tb_Codigo;
    @FXML
    private JFXDatePicker dtp_Data;
    @FXML
    private JFXComboBox<Produto> cbb_Produto;
    @FXML
    private JFXComboBox<Tamanho> cbb_Tamanho;
    @FXML
    private VBox pnpesquisa;
    @FXML
    private TableView<ItensConsignado> tabela;
    @FXML
    private TableColumn<ItensConsignado, Integer> colProduto;
    @FXML
    private TableColumn<ItensConsignado, String> colTamanho;
    @FXML
    private TableColumn<ItensConsignado, Double> colPreco;
    @FXML
    private JFXButton btn_AdicionarItem;
    @FXML
    private JFXButton btn_RemoverItem;
    @FXML
    private JFXButton btn_ProcurarCompra;

    
    @FXML
    private JFXTextField tb_ValorTotal;

    private List<ItensConsignado> aux = new ArrayList();
    private List<ItensConsignado> del = new ArrayList();
    
    private ItensConsignado it = null;
    private Consignado c;
    private Usuario u;
    private ObservableList<ItensConsignado> modelo;
    private double valor;
    private double desconto;
    
    private static Object compra;
    @FXML
    private JFXComboBox<Cliente> cbb_Cliente;
    @FXML
    private JFXComboBox<Funcionario> cbb_funcionario;
    @FXML
    private JFXButton btn_apagar;
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb)
    {
        // TODO
        colProduto.setCellValueFactory(new PropertyValueFactory("codProduto"));
        colTamanho.setCellValueFactory(new PropertyValueFactory("tamanho"));
        colPreco.setCellValueFactory(new PropertyValueFactory("valorProduto"));

        tb_ValorTotal.setDisable(true);
        tb_ValorTotal.setText(double2string(0.0));
        
        estadoOriginal();
    }

    public void RecebeDados(Usuario u)
    {
        this.u = u;
    }

    private void estadoOriginal()
    {
        pnpesquisa.setDisable(false);
        pndados.setDisable(true);
        btn_Confirmar.setDisable(true);
        btn_Cancelar.setDisable(false);
        btn_Novo.setDisable(false);
        btn_apagar.setDisable(true);
        btn_AdicionarItem.setDisable(true);
        btn_RemoverItem.setDisable(true);
        btn_ProcurarCompra.setDisable(false);
        //tabela.getItems().clear();
        if(modelo != null)
        {
                modelo.clear();
                aux.clear();
        }
        dtp_Data.setDisable(true);

        ObservableList<Node> componentes = pndados.getChildren(); //”limpa” os componentes
        for (Node n : componentes)
        {
            if (n instanceof TextInputControl) // textfield, textarea e htmleditor
            {
                ((TextInputControl) n).setText("");
            }
            if (n instanceof ComboBox)
            {
                ((ComboBox) n).getItems().clear();
            }
        }
        carregaTabela("");
    }

    private void estadoEdicao()
    {
        pnpesquisa.setDisable(false);
        pndados.setDisable(false);
        btn_Confirmar.setDisable(false);
        btn_AdicionarItem.setDisable(false);
        btn_RemoverItem.setDisable(false);
        dtp_Data.setDisable(false);
        btn_ProcurarCompra.setDisable(true);
        btn_apagar.setDisable(false);
    }

    public static Object getCompra()
    {
        return compra;
    }
    
    public void recebeInfo()
    {
        Consignado c = (Consignado) FXMLProcurarConsignadoController.getConsignado();
        //ItensConsignadoBD bd = new ConsignadoBD();
        
        ItensConsignado itens = new ItensConsignado();
        
        if (c != null)
        {            
            aux = itens.selectItens("codconsignado = "+c.getCod());
            
            
            
            
            tb_Codigo.setText("" + c.getCod());
            dtp_Data.setValue(c.getDtEntrega());
            cbb_Cliente.getSelectionModel().select(0);// gambis
            cbb_Cliente.getSelectionModel().select(c.getCodCliente().getCod());
            cbb_funcionario.getSelectionModel().select(0);// gambis
            cbb_funcionario.getSelectionModel().select(c.getCodFuncionario().getCodigo());
            cbb_Produto.getSelectionModel().select(0);// gambis
            cbb_Tamanho.getSelectionModel().select(0);// gambis

            btn_apagar.setDisable(false);
            
            modelo = FXCollections.observableArrayList(aux);
            
            tabela.setItems(modelo);
            tabela.refresh();
            btn_ProcurarCompra.setDisable(true);
            atualizaSaldo();
            estadoEdicao();
        } else
        {
            estadoOriginal();
        }
    }

    private void carregaTabela(String filtro)
    {
        cbb_funcionario.setItems(FXCollections.observableArrayList(new Funcionario().selectFuncionario("")));
        cbb_Produto.setItems(FXCollections.observableArrayList(new Produto().selectProduto("")));
        cbb_Cliente.setItems(FXCollections.observableArrayList(new Cliente().selectClienteSemConsignadoAberto("")));
    }

    @FXML
    private void clkBtNovo(ActionEvent event)
    {
        estadoEdicao();
        tb_Codigo.setDisable(true);
        tabela.setDisable(false);
        tb_ValorTotal.setText(double2string(0.0));
        btn_ProcurarCompra.setDisable(true);
    }
    
    
    
    @FXML
    private void clkBtConfirmar(ActionEvent event)
    {
       
        int cod;
        LocalDate dataAtual = LocalDate.now();
        LocalDate dataDevolucao = dtp_Data.getValue();
        dataDevolucao.plusDays(3);
        Alert a = new Alert(Alert.AlertType.INFORMATION);
        
        Produto p = new Produto();
        try
        {
            cod = Integer.parseInt(tb_Codigo.getText());
        } catch (Exception e)
        {
            cod = 0;
        }
        
        if (dtp_Data.getValue().isBefore(dataAtual) || dtp_Data.getValue().isEqual(dataAtual))
        {
            if (cbb_Cliente.getSelectionModel().getSelectedIndex() != -1)
            {
                if (cbb_funcionario.getSelectionModel().getSelectedIndex() != -1)
                {
                    c = new Consignado(cod, cbb_funcionario.getValue(),
                            dtp_Data.getValue(), dataDevolucao,
                            cbb_Cliente.getValue(),
                            "A");
                    if (cod == 0)
                    {
                        if (c.insertConsignado())
                        {
                            if(!c.insereItens(aux, c.getMaxPK()))
                            {
                                a.setContentText("Problemas ao Gravar");
                                a.showAndWait();
                            }
                        }
                    } else
                    {       
                        if (c.updateConsignado())
                        {
                            ItensConsignado itens = new ItensConsignado();
                            itens.deleteItens(cod);
                            if(!c.insereItens(aux, c.getCod()))
                            {
                                a.setContentText("Problemas ao Gravar");
                                a.showAndWait();
                            }
                        }
                    }
                    estadoOriginal();
                    
                } else
                {
                    a.setContentText("Informe o funcionário!");
                }
            } else
            {
                a.setContentText("Informe o cliente!");
            }

        } else
        {
            a.setContentText("Informe o fornecedor!");
            a.showAndWait();
        }
        carregaTabela("");
        this.aux.clear();
    }
    

    @FXML
    private void clkBtCancelar(ActionEvent event)
    {
        if (!pndados.isDisabled()) // encontra em estado de edição
        {
            estadoOriginal();
        } else
        {
            spnprincipal.setCenter(null);
        }
    }

    private void clkBtNovoP(ActionEvent event)
    {
        try
        {
            Stage stage = new Stage();
            FXMLLoader loader = new FXMLLoader(getClass().getResource("FXMLCadastroProduto.fxml"));
            Parent root = (Parent) loader.load();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.setTitle("Cadastro de Produtos");
            stage.showAndWait();
            FXMLCadastroProdutoController ctr = loader.getController();
            ctr.RecebeDados(u);

        } catch (IOException ex)
        {
            System.out.println(ex);
        }
        carregaTabela("");
    }

    private void clkBtNovoT(ActionEvent event)
    {
        try
        {
            Stage stage = new Stage();
            FXMLLoader loader = new FXMLLoader(getClass().getResource("FXMLCadastroTamanho.fxml"));
            Parent root = (Parent) loader.load();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.setTitle("Cadastro de Tamanhos");
            stage.showAndWait();
            FXMLCadastroTamanhoController ctr = loader.getController();
            ctr.RecebeDados(u);

        } catch (IOException ex)
        {
            System.out.println(ex);
        }
        carregaTabela("");
    }

    @FXML
    private void clkBtAdicionarItem(ActionEvent event)
    {
        
        Alert a = new Alert(Alert.AlertType.INFORMATION);

        if (cbb_Produto.getSelectionModel().getSelectedIndex() != -1)
        {
            if (cbb_Tamanho.getSelectionModel().getSelectedIndex() != -1)
            {
                it = new ItensConsignado(cbb_Produto.getValue(), cbb_Tamanho.getValue(),
                        cbb_Produto.getValue().getPreco(), 1);
                
                aux.add(it);

                modelo = FXCollections.observableArrayList(aux);
                tabela.setItems(modelo);
                cbb_Produto.getSelectionModel().select(-1);
                cbb_Tamanho.getItems().clear();

                atualizaSaldo();
            }
            else
            {
               a.setContentText("Selecione um tamanho");
               a.show();
            }      
        }else
        {
           a.setContentText("Selecione um produto");
           a.show();
        }
    }

    public static Double myParseDouble(String val)
    {
        if (val.isEmpty())
        {
            return 0.0;
        }
        return Double.parseDouble(val.trim().replace(".", "").replace(",", "."));
    }

    public static String double2string(double v)
    {
        return String.format("%,.2f", v);
    }
    
    private void atualizaSaldo()
    {
        double saldo = 0;
        for (ItensConsignado i : modelo)
        {
            saldo = saldo + i.getValorProduto();
        }
        tb_ValorTotal.setText(saldo+"");
    }
    @FXML
    private void clkBtRemoverItem(ActionEvent event)
    {
        if (tabela.getSelectionModel().getSelectedItem() != null)
        {
            int index = tabela.getSelectionModel().getSelectedIndex();
            modelo.remove(index);
            aux.remove(index);
            atualizaSaldo();
            tabela.setItems(modelo);
        }
    }

    @FXML
    private void clkBtProcurarCompra(ActionEvent event)
    {
        estadoEdicao();
        tb_Codigo.setDisable(true);
        try
        {
            Stage stage = new Stage();
            FXMLLoader loader = new FXMLLoader(getClass().getResource("FXMLProcurarConsignado.fxml"));
            Parent root = (Parent) loader.load();
            Scene scene = new Scene(root);
            stage.setScene(scene);
            stage.setTitle("Procurar Consignados Realizados");
            stage.showAndWait();
            FXMLProcurarConsignadoController ctr = loader.getController();
            ctr.RecebeDados(u);
            recebeInfo();

        } catch (IOException ex)
        {
            System.out.println(ex);
        }
    }

    @FXML
    private void clkColocaTamanho(Event event)
    {
        if (cbb_Produto.getSelectionModel().getSelectedIndex() != -1)
        {
            cbb_Tamanho.setItems(FXCollections.observableArrayList(new Tamanho().selectTamanho("codProduto =" + cbb_Produto.getValue().getCod())));
        }
    }

    @FXML
    private void clkBtApagar(ActionEvent event) {
        Alert a = new Alert(Alert.AlertType.CONFIRMATION);
        a.setContentText("Confirma a exclusão?");
        if (a.showAndWait().get() == ButtonType.OK)
        {
            int cod;
            try
            {
                cod = Integer.parseInt(tb_Codigo.getText());
            } catch (Exception e)
            {
                cod = 0;
            }
            ItensConsignado itens = new ItensConsignado();
            itens.deleteItens(cod);
            c = new Consignado();
            if (!c.deleteConsignado(cod))
            {
                a.setContentText("Erro ao excluir!");
                a.showAndWait();
            }
            estadoOriginal();
        }
    }


}
