/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;


import static Interface.TelaPrincipalController.spnprincipal;
import Mask.MaskFieldUtil;
import Model.Parametros;
import Model.Usuario;
import com.jfoenix.controls.JFXButton;
import com.jfoenix.controls.JFXTextField;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.control.Alert;
import javafx.scene.control.ComboBox;
import javafx.scene.control.SplitPane;
import javafx.scene.control.TextInputControl;
import javafx.scene.layout.AnchorPane;


/**
 * FXML Controller class
 *
 * @author Gabriel
 */
public class FXMLParametrizacaoController implements Initializable
{

    
    
    private Usuario u;
    @FXML
    private SplitPane painel;
    @FXML
    private JFXButton btn_Alterar;
    @FXML
    private JFXButton btn_Cancelar;
    @FXML
    private AnchorPane pndados;
    @FXML
    private JFXTextField tb_Nome;
    @FXML
    private JFXTextField tb_End;
    @FXML
    private JFXTextField tb_Site;
    @FXML
    private JFXTextField tb_RazaoSocial;
    @FXML
    private JFXTextField tb_Email;
    @FXML
    private JFXTextField tb_Telefone;
    @FXML
    private JFXButton btn_Confirmar;
    
  
    @Override
    
    public void initialize(URL location, ResourceBundle resources) {

        MaskFieldUtil.maxField(tb_Telefone, 40);
        MaskFieldUtil.foneField(tb_Telefone);
        estadoOriginal();
    }
    
    protected void RecebeDados(Usuario u){
       this.u=u;
    }
    private void estadoOriginal()
    {
        pndados.setDisable(true);
        btn_Confirmar.setDisable(true);
        btn_Cancelar.setDisable(false);
        btn_Alterar.setDisable(false);
        
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
        
        Parametros p = new Parametros();
        p = p.selectParametro();
               
        tb_Email.setText(p.getEmail());
        tb_Nome.setText(p.getNomeF());
        tb_End.setText(p.getEndereco());
        tb_RazaoSocial.setText(p.getRazaoSocial());
        tb_Site.setText(p.getSite());
        tb_Telefone.setText(p.getTelefone());
           
    }

    private void estadoEdicao()
    {
        pndados.setDisable(false);
        btn_Confirmar.setDisable(false);
        btn_Alterar.setDisable(true);
        tb_Nome.requestFocus();
        btn_Alterar.setDisable(true);
    }
    @FXML
    private void clkBtConfirmar(ActionEvent event) {
        Parametros p = new Parametros();
        Alert a = new Alert(Alert.AlertType.INFORMATION);
        if (tb_Nome.getText().length() > 0)
        {
            if (tb_RazaoSocial.getText().length() > 0)
            {
                if (tb_Telefone.getText().length() > 0)
                {
                    if (tb_End.getText().length() > 0)
                    {
                        if (tb_Email.getText().length() > 0 && tb_Email.getText().contains("@"))
                        {
                            if (tb_Site.getText().length() > 0)
                            {
                                p = new Parametros(tb_Nome.getText(), tb_RazaoSocial.getText(), tb_End.getText(), tb_Site.getText(), tb_Email.getText(), tb_Telefone.getText());

                                if (!p.updateParametros())
                                {
                                    a.setContentText("Problemas ao Alterar");
                                    a.showAndWait();
                                } else
                                {
                                    a.setContentText("Alterado com Sucesso");
                                    a.showAndWait();
                                    estadoOriginal();
                                }
                            } else
                            {
                                a.setContentText("Informe o Site");
                                a.showAndWait();
                            }
                        }
                        else
                        {
                             a.setContentText("Informe o Email!");
                            a.showAndWait();
                        }
                    } else
                    {
                        a.setContentText("Informe o Endereço!");
                        a.showAndWait();
                    }
                } else
                {
                    a.setContentText("Informe o Telefone!");
                    a.showAndWait();
                }
            } else
            {
                a.setContentText("Informe a Razaão Social");
                a.showAndWait();
            }
        } else
        {
            a.setContentText("Informe o Nome Fantasia!");
            a.showAndWait();
        }
    }

    @FXML
    private void clkBtCancelar(ActionEvent event) {
        if (!pndados.isDisabled()) // encontra em estado de edição
        {
            estadoOriginal();
        } else
        {
            spnprincipal.setCenter(null);
        }
    }

    @FXML
    private void clkBtAlterar(ActionEvent event) {

        estadoEdicao();
       
    }

}
